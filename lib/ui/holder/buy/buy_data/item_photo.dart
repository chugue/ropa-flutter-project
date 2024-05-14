class ItemPhoto {
  final int photoId;
  final String uuidName;
  final String base64;
  final bool isMainPhoto;

  const ItemPhoto({
    required this.photoId,
    required this.uuidName,
    required this.base64,
    required this.isMainPhoto,
  });

  factory ItemPhoto.fromJson(Map<String, dynamic> json) {
    return ItemPhoto(
      photoId: json["photoId"],
      uuidName: json["uuidName"],
      base64: json["base64"],
      isMainPhoto: json["isMainPhoto"],
    );
  }
//
}
