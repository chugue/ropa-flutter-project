class ItemPhotos {
  final int itemsPhotoId;
  final String itemsPhotoName;
  final String itemsPhotoPath;

  const ItemPhotos({
    required this.itemsPhotoId,
    required this.itemsPhotoName,
    required this.itemsPhotoPath,
  });

  factory ItemPhotos.fromJson(Map<String, dynamic> json) {
    return ItemPhotos(
      itemsPhotoId: json["itemsPhotoId"],
      itemsPhotoName: json["itemsPhotoName"],
      itemsPhotoPath: json["itemsPhotoPath"],
    );
  }
//
}
