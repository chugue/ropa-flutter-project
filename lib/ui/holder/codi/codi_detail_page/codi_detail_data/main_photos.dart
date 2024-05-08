class MainPhotos {
  final int mainPhotoId;
  final String mainPhotoName;
  final String mainPhotoPath;

  const MainPhotos({
    required this.mainPhotoId,
    required this.mainPhotoName,
    required this.mainPhotoPath,
  });

  factory MainPhotos.fromJson(Map<String, dynamic> json) {
    return MainPhotos(
      mainPhotoId: json["mainPhotoId"],
      mainPhotoName: json["mainPhotoName"],
      mainPhotoPath: json["mainPhotoPath"],
    );
  }
//
}
