class MainPhotos {
  final int mainPhotoId;
  final String mainPhotoName;
  final String base64;
  final bool isMainPhoto = true;

  const MainPhotos({
    required this.mainPhotoId,
    required this.mainPhotoName,
    required this.base64,
  });

  factory MainPhotos.fromJson(Map<String, dynamic> json) {
    return MainPhotos(
      mainPhotoId: json["mainPhotoId"],
      mainPhotoName: json["mainPhotoName"],
      base64: json["base64"],
    );
  }
//
}
