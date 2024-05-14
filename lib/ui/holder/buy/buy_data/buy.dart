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

  Buy copyWith({
    String? name,
    String? phone,
    String? address,
    String? detailAddress,
    String? email,
    int? orderId,
    String? deliveryRequest,
    bool? isBaseAddress,
  }) {
    return Buy(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      detailAddress: detailAddress ?? this.detailAddress,
      email: email ?? this.email,
      orderId: orderId ?? this.orderId,
      deliveryRequest: deliveryRequest ?? this.deliveryRequest,
      isBaseAddress: isBaseAddress ?? this.isBaseAddress,
    );
  }
}
