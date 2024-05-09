class AdminInfo {
  final int brandId;
  final String brandName;

  const AdminInfo({
    required this.brandId,
    required this.brandName,
  });

  factory AdminInfo.fromJson(Map<String, dynamic> json) {
    return AdminInfo(
      brandId: json["brandId"],
      brandName: json["brandName"],
    );
  }
}
