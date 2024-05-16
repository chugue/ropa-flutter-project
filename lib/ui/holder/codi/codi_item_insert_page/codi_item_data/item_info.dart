class ItemInfo {
  final int itemId;
  final String itemName;
  final String photoName;
  final String base64;
  final bool isMainPhoto;

  const ItemInfo({
    required this.itemId,
    required this.itemName,
    required this.photoName,
    required this.base64,
    required this.isMainPhoto,
  });

  factory ItemInfo.fromJson(Map<String, dynamic> json) {
    return ItemInfo(
      itemId: json["itemId"],
      itemName: json["itemName"],
      photoName: json["photoName"],
      base64: json["base64"],
      isMainPhoto: json["isMainPhoto"],
    );
  }
}
