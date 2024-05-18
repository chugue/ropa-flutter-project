class DetailPhotos {
  final int itemPhotoId;
  final String subPhotoName;
  final String photoPath;
  final bool isMainPhoto;
  final String sort;

  const DetailPhotos({
    required this.itemPhotoId,
    required this.subPhotoName,
    required this.photoPath,
    required this.isMainPhoto,
    required this.sort,
  });

  factory DetailPhotos.fromJson(Map<String, dynamic> json) {
    return DetailPhotos(
      itemPhotoId: json["itemPhotoId"],
      subPhotoName: json["subPhotoName"],
      photoPath: json["photoPath"],
      isMainPhoto: json["isMainPhoto"],
      sort: json["sort"],
    );
  }
}
