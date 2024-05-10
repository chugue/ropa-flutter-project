class ItemPhotos {
  final int itemsPhotoId;
  final int itemsId;
  final String itemsPhotoName;
  final String base64;
  final bool isMainPhoto = true;

  const ItemPhotos({
    required this.itemsPhotoId,
    required this.itemsId,
    required this.itemsPhotoName,
    required this.base64,
  });

  factory ItemPhotos.fromJson(Map<String, dynamic> json) {
    return ItemPhotos(
      itemsPhotoId: json["itemsPhotoId"],
      itemsId: json["itemsId"],
      itemsPhotoName: json["itemsPhotoName"],
      base64: json["base64"],
    );
  }
//
}
