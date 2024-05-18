class MainPhotos {
  final int photoId;
  final String mainPhotoName;
  final String photoPath;
  final String sort;

  const MainPhotos({
    required this.photoId,
    required this.mainPhotoName,
    required this.photoPath,
    required this.sort,
  });

  factory MainPhotos.fromJson(Map<String, dynamic> json) {
    return MainPhotos(
      photoId: json["photoId"],
      mainPhotoName: json["mainPhotoName"],
      photoPath: json["photoPath"],
      sort: json["sort"],
    );
  }
//
}
