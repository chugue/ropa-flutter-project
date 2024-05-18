class MainPhotos {
  final int mainPhotoId;
  final String mainPhotoName;
  final String photoPath;
  final bool isMainPhoto = true;

  const MainPhotos({
    required this.mainPhotoId,
    required this.mainPhotoName,
    required this.photoPath,
  });

  factory MainPhotos.fromJson(Map<String, dynamic> json) {
    return MainPhotos(
      mainPhotoId: json["mainPhotoId"],
      mainPhotoName: json["mainPhotoName"],
      photoPath: json["photoPath"],
    );
  }
//
}
