class CodiPhoto {
  final int photoId;
  final int codiId;
  final String codiBase64;

  CodiPhoto({
    required this.photoId,
    required this.codiId,
    required this.codiBase64,
  });

  factory CodiPhoto.fromJson(Map<String, dynamic> json) {
    return CodiPhoto(
      photoId: int.parse(json["photoId"]),
      codiId: int.parse(json["codiId"]),
      codiBase64: json["codiBase64"],
    );
  }
}
