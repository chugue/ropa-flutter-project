class ItemInfo {
  final int itemId;
  final String itemName;
  final String base64;

  const ItemInfo({
    required this.itemId,
    required this.itemName,
    required this.base64,
  });

  factory ItemInfo.fromJson(Map<String, dynamic> json) {
    return ItemInfo(
      itemId: json["itemId"],
      itemName: json["itemName"],
      base64: json["base64"],
    );
  }
}
