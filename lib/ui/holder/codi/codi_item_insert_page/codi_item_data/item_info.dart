class ItemInfo {
  final int itemId;
  final String itemName;
  final String photoPath;

  const ItemInfo({
    required this.itemId,
    required this.itemName,
    required this.photoPath,
  });

  factory ItemInfo.fromJson(Map<String, dynamic> json) {
    return ItemInfo(
      itemId: json["itemId"],
      itemName: json["itemName"],
      photoPath: json["photoPath"],
    );
  }
}
