class WalletModel {
  final String seedPhrase;

  final String address;

  WalletModel({required this.seedPhrase, required this.address});

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
        address: json['address'], seedPhrase: json['seedPhrase']);
  }

  Map<String, dynamic> toJson() {
    return {'address': address, "seedPhrase": seedPhrase};
  }

  @override
  String toString() {
    return "Wallet($seedPhrase - seed | $address)";
  }
}
