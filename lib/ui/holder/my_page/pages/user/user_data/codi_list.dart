class CodiList {
  int codiId;
  int? codiPhotoId;
  String photoName;
  String photoPath;
  String codiPhoto;

  CodiList({
    required this.codiId,
    required this.codiPhotoId,
    required this.photoName,
    required this.photoPath,
    required this.codiPhoto,
  });

  factory CodiList.fromJson(Map<String, dynamic> json) {
    return CodiList(
      codiId: json["codiId"],
      codiPhotoId: json["codiPhotoId"] ?? null,
      photoName: json["photoName"] ?? '',
      photoPath: json["photoPath"],
      codiPhoto: json["codiPhoto"] ?? '' ,
    );
  }
}
