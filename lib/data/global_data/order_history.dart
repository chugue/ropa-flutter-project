class OrderHistory {
  final int id;
  final int userId;
  final int deliveryId;
  final double totalOrderAmount;
  final double fee;
  final DateTime orderDate;

  OrderHistory({
    required this.id,
    required this.userId,
    required this.deliveryId,
    required this.totalOrderAmount,
    required this.fee,
    required this.orderDate,
  });
}

List<OrderHistory> orderHistories = [
  OrderHistory(
    id: 1,
    userId: 1,
    deliveryId: 1,
    totalOrderAmount: 50000,
    fee: 5000,
    orderDate: DateTime(2024, 5, 04, 12, 45),
  ),
  OrderHistory(
    id: 2,
    userId: 2,
    deliveryId: 2,
    totalOrderAmount: 75000,
    fee: 7500,
    orderDate: DateTime(2024, 5, 04, 12, 45),
  ),
  OrderHistory(
    id: 3,
    userId: 3,
    deliveryId: 3,
    totalOrderAmount: 100000,
    fee: 10000,
    orderDate: DateTime(2024, 5, 04, 12, 45),
  ),
];
