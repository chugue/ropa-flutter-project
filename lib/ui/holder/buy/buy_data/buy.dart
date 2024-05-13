class Buy {
  final int orderId;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String detailAddress;
  final String deliveryRequest;
  final bool isBaseAddress;

  const Buy({
    required this.orderId,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.detailAddress,
    required this.deliveryRequest,
    required this.isBaseAddress,
  });

  factory Buy.fromJson(Map<String, dynamic> json) {
    return Buy(
      orderId: json["orderId"],
      name: json["name"] ?? '',
      phone: json["phone"] ?? '',
      email: json["email"] ?? '',
      address: json["address"] ?? '',
      detailAddress: json["detailAddress"] ?? '',
      deliveryRequest: json["deliveryRequest"] ?? '',
      isBaseAddress: json["isBaseAddress"],
    );
  }
//
}
