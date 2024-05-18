class ItemPhoto {
  final int photoId;
  final String uuidName;
  final String photoPath;
  final bool isMainPhoto;

  const ItemPhoto({
    required this.photoId,
    required this.uuidName,
    required this.photoPath,
    required this.isMainPhoto,
  });

  factory ItemPhoto.fromJson(Map<String, dynamic> json) {
    return ItemPhoto(
      photoId: json["photoId"],
      uuidName: json["uuidName"],
      photoPath: json["photoPath"],
      isMainPhoto: json["isMainPhoto"],
    );
  }
//
}
