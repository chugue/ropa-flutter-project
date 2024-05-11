class DetailPhotos{
  final int itemPhotoId;
  final String subPhotoName;
  final String subPhotoBase64;
  final bool isMainPhoto;
  final String sort;

  const DetailPhotos({
    required this.itemPhotoId,
    required this.subPhotoName,
    required this.subPhotoBase64,
    required this.isMainPhoto,
    required this.sort,
  });

  factory DetailPhotos.fromJson(Map<String, dynamic> json) {
    return DetailPhotos(
      itemPhotoId: json["itemPhotoId"],
      subPhotoName: json["subPhotoName"],
      subPhotoBase64: json["subPhotoBase64"],
      isMainPhoto: json["isMainPhoto"],
      sort: json["sort"],
    );
  }

}