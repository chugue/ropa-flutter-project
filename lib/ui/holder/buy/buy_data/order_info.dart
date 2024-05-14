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

  OrderInfo copyWith({
    int? orderAmount,
    int? deliveryFee,
    int? discount,
    int? purchaseAmount,
    String? payMethod,
    bool? savedPayMethod,
  }) {
    return OrderInfo(
      orderAmount: orderAmount ?? this.orderAmount,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      discount: discount ?? this.discount,
      purchaseAmount: purchaseAmount ?? this.purchaseAmount,
      payMethod: payMethod ?? this.payMethod,
      savedPayMethod: savedPayMethod ?? this.savedPayMethod,
    );
  } //
}
