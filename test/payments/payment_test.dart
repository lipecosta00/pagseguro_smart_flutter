import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pagseguro_smart_flutter/payments/payment.dart';
import 'package:pagseguro_smart_flutter/payments/handler/payment_handler.dart';

class MockPaymentHandler implements PaymentHandler {
  @override
  void onTransactionSuccess() {}

  @override
  void onError(String message) {}

  @override
  void onMessage(String message) {}

  @override
  void onFinishedResponse(String message) {}

  @override
  void onLoading(bool show) {}

  @override
  void writeToFile({
    String transactionCode = '',
    String transactionId = '',
    String response = '',
  }) {}

  @override
  void onAbortedSuccessfully() {}

  @override
  void disposeDialog() {}

  @override
  void onActivationDialog() {}

  @override
  void onAuthProgress(String message) {}

  @override
  void onTransactionInfo({
    String transactionCode = '',
    String transactionId = '',
    String response = '',
  }) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MethodChannel channel;
  late Payment payment;
  late List<MethodCall> log;

  setUp(() {
    channel = const MethodChannel('pagseguro_smart_flutter');
    log = [];

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      log.add(methodCall);

      if (methodCall.method == 'getSubAcquirerData') {
        return {
          'cnpjCpf': '12345678000199',
          'docType': 'J',
          'merchantId': 'MERCHANT123',
          'fullName': 'Empresa Teste LTDA',
          'name': 'Empresa Teste',
          'address': 'Rua Teste, 123',
          'city': 'São Paulo',
          'uf': 'SP',
          'zipCode': '01234567',
          'country': 'BRA',
          'telephone': '11999999999',
          'mcc': '5411',
        };
      }
      return null;
    });

    payment = Payment(channel: channel, paymentHandler: MockPaymentHandler());
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  group('getSubAcquirerData', () {
    test('retorna dados do sub-adquirente com sucesso', () async {
      final result = await payment.getSubAcquirerData();

      expect(result, isNotNull);
      expect(result!.cnpjCpf, '12345678000199');
      expect(result.docType, 'J');
      expect(result.fullName, 'Empresa Teste LTDA');
      expect(result.merchantId, 'MERCHANT123');
      expect(result.city, 'São Paulo');
      expect(result.uf, 'SP');
      expect(log.last.method, 'getSubAcquirerData');
    });

    test('retorna null quando não há perfil configurado', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        return null;
      });

      final result = await payment.getSubAcquirerData();
      expect(result, isNull);
    });

    test('retorna null em caso de erro', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        throw PlatformException(code: 'SUB_ACQUIRER_ERROR', message: 'Erro');
      });

      final result = await payment.getSubAcquirerData();
      expect(result, isNull);
    });
  });
}
