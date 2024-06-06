class CreatorCodiList {
  int codiId;
  int? userId;
  int? photoId;
  int? codiPhotoId;
  String? photoName;
  String? photoPath;
  String? codiPhoto;

  CreatorCodiList({
    required this.codiId,
    required this.userId,
    required this.photoId,
    required this.codiPhotoId,
    required this.photoName,
    required this.photoPath,
    required this.codiPhoto,
  });

  factory CreatorCodiList.fromJson(Map<String, dynamic> json) {
    return CreatorCodiList(
      codiId: json["codiId"],
      userId: json["userId"] ?? null,
      photoId: json["photoId"] ?? null,
      codiPhotoId: json["codiPhotoId"] ?? null,
      photoName: json["photoName"] ?? '',
      photoPath: json["photoPath"] ?? '',
      codiPhoto: json["codiPhoto"] ?? '',
    );
  }
}
