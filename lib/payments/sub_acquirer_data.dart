/// Represents the sub-acquirer data retrieved from the POS terminal.
class SubAcquirerData {
  final String? cnpjCpf;
  final String? docType;
  final String? merchantId;
  final String? fullName;
  final String? name;
  final String? address;
  final String? city;
  final String? uf;
  final String? zipCode;
  final String? country;
  final String? telephone;
  final String? mcc;

  SubAcquirerData({
    this.cnpjCpf,
    this.docType,
    this.merchantId,
    this.fullName,
    this.name,
    this.address,
    this.city,
    this.uf,
    this.zipCode,
    this.country,
    this.telephone,
    this.mcc,
  });

  factory SubAcquirerData.fromMap(Map<String, dynamic>? map) {
    if (map == null) return SubAcquirerData();
    return SubAcquirerData(
      cnpjCpf: map['cnpjCpf'] as String?,
      docType: map['docType'] as String?,
      merchantId: map['merchantId'] as String?,
      fullName: map['fullName'] as String?,
      name: map['name'] as String?,
      address: map['address'] as String?,
      city: map['city'] as String?,
      uf: map['uf'] as String?,
      zipCode: map['zipCode'] as String?,
      country: map['country'] as String?,
      telephone: map['telephone'] as String?,
      mcc: map['mcc'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cnpjCpf': cnpjCpf,
      'docType': docType,
      'merchantId': merchantId,
      'fullName': fullName,
      'name': name,
      'address': address,
      'city': city,
      'uf': uf,
      'zipCode': zipCode,
      'country': country,
      'telephone': telephone,
      'mcc': mcc,
    };
  }

  dynamic operator [](String key) {
    switch (key) {
      case 'cnpjCpf':
        return cnpjCpf;
      case 'docType':
        return docType;
      case 'merchantId':
        return merchantId;
      case 'fullName':
        return fullName;
      case 'name':
        return name;
      case 'address':
        return address;
      case 'city':
        return city;
      case 'uf':
        return uf;
      case 'zipCode':
        return zipCode;
      case 'country':
        return country;
      case 'telephone':
        return telephone;
      case 'mcc':
        return mcc;
      default:
        return null;
    }
  }

  @override
  String toString() {
    return 'SubAcquirerData(cnpjCpf: $cnpjCpf, name: $name, address: $address, city: $city, uf: $uf, zipCode: $zipCode, country: $country, telephone: $telephone, mcc: $mcc)';
  }
}