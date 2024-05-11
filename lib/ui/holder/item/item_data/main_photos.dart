class MainPhotos{
  final int photoId;
  final String mainPhotoName;
  final String mainPhotoBase64;
  final String sort;

  const MainPhotos({
    required this.photoId,
    required this.mainPhotoName,
    required this.mainPhotoBase64,
    required this.sort,
  });

  factory MainPhotos.fromJson(Map<String, dynamic> json) {
    return MainPhotos(
      photoId: json["photoId"],
      mainPhotoName: json["mainPhotoName"],
      mainPhotoBase64: json["mainPhotoBase64"],
      sort: json["sort"],
    );
  }
//
}