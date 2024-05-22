class CreatorViewCodiList {
  int codiId;
  int? codiPhotoId;
  String photoName;
  String photoPath;
  String codiPhoto;

  CreatorViewCodiList({
    required this.codiId,
    required this.codiPhotoId,
    required this.photoName,
    required this.photoPath,
    required this.codiPhoto,
  });

  factory CreatorViewCodiList.fromJson(Map<String, dynamic> json) {
    return CreatorViewCodiList(
      codiId: json["codiId"],
      codiPhotoId: json["codiPhotoId"] ?? null,
      photoName: json["photoName"] ?? '',
      photoPath: json["photoPath"],
      codiPhoto: json["codiPhoto"] ?? '' ,
    );
  }
}
