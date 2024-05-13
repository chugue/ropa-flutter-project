class OrderInfo {
  final int orderAmount;
  final int deliveryFee;
  final int discount;
  final int purchaseAmount;
  final String payMethod;
  final bool savedPayMethod;

  const OrderInfo({
    required this.orderAmount,
    required this.deliveryFee,
    required this.discount,
    required this.purchaseAmount,
    required this.payMethod,
    required this.savedPayMethod,
  });

  factory OrderInfo.fromJson(Map<String, dynamic> json) {
    return OrderInfo(
      orderAmount: json["orderAmount"],
      deliveryFee: json["deliveryFee"],
      discount: json["discount"],
      purchaseAmount: json["purchaseAmount"],
      payMethod: json["payMethod"],
      savedPayMethod: json["savedPayMethod"],
    );
  }
//
}
