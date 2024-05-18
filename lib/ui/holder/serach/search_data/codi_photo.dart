class CodiPhoto {
  final int photoId;
  final int codiId;
  final String photoPath;

  CodiPhoto({
    required this.photoId,
    required this.codiId,
    required this.photoPath,
  });

  factory CodiPhoto.fromJson(Map<String, dynamic> json) {
    return CodiPhoto(
      photoId: json["photoId"],
      codiId: json["codiId"],
      photoPath: json["photoPath"],
    );
  }
}
