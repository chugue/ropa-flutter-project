class ItemHistoryList {
  final int orderId;
  final int itemId;
  final int itemCount;
  final int itemPrice;
  final int itemTotalPrice;
  final String itemName;
  final String itemPhotoName;
  final String itemBase64;
  final String itemCategoryMain;
  final String deliveryStatus;

  const ItemHistoryList({
    required this.orderId,
    required this.itemId,
    required this.itemCount,
    required this.itemPrice,
    required this.itemTotalPrice,
    required this.itemName,
    required this.itemPhotoName,
    required this.itemBase64,
    required this.itemCategoryMain,
    required this.deliveryStatus,
  });

  factory ItemHistoryList.fromJson(Map<String, dynamic> json) {
    return ItemHistoryList(
      orderId: json["orderId"],
      itemId: json["itemId"],
      itemCount: json["itemCount"],
      itemPrice: json["itemPrice"],
      itemTotalPrice: json["itemTotalPrice"],
      itemName: json["itemName"],
      itemPhotoName: json["itemPhotoName"],
      itemBase64: json["itemBase64"],
      itemCategoryMain: json["itemCategoryMain"],
      deliveryStatus: json["deliveryStatus"],
    );
  }
}
