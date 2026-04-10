/// Represents the user data retrieved from the POS terminal.
class UserData {
  final String? address;
  final String? city;
  final String? cnpjCpf;
  final String? addressComplement;
  final String? companyName;
  final String? userNickName;
  final String? addressState;
  final String? email;

  UserData({
    this.address,
    this.city,
    this.cnpjCpf,
    this.addressComplement,
    this.companyName,
    this.userNickName,
    this.addressState,
    this.email,
  });

  factory UserData.fromMap(Map<String, dynamic>? map) {
    if (map == null) return UserData();
    return UserData(
      address: map['address'] as String?,
      city: map['city'] as String?,
      cnpjCpf: map['cnpjCpf'] as String?,
      addressComplement: map['addressComplement'] as String?,
      companyName: map['companyName'] as String?,
      userNickName: map['userNickName'] as String?,
      addressState: map['addressState'] as String?,
      email: map['email'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'city': city,
      'cnpjCpf': cnpjCpf,
      'addressComplement': addressComplement,
      'companyName': companyName,
      'userNickName': userNickName,
      'addressState': addressState,
      'email': email,
    };
  }

  dynamic operator [](String key) {
    switch (key) {
      case 'address':
        return address;
      case 'city':
        return city;
      case 'cnpjCpf':
        return cnpjCpf;
      case 'addressComplement':
        return addressComplement;
      case 'companyName':
        return companyName;
      case 'userNickName':
        return userNickName;
      case 'addressState':
        return addressState;
      case 'email':
        return email;
      default:
        return null;
    }
  }

  @override
  String toString() {
    return 'UserData(address: $address, city: $city, cnpjCpf: $cnpjCpf, addressComplement: $addressComplement, companyName: $companyName, userNickName: $userNickName, addressState: $addressState, email: $email)';
  }
}
