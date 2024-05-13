class UserCodiList {
  int codiId;
  int codiPhotoId;
  String photoName;
  String base64;
  String codiPhoto;

  UserCodiList({
    required this.codiId,
    required this.codiPhotoId,
    required this.photoName,
    required this.base64,
    required this.codiPhoto,
  });

  factory UserCodiList.fromJson(Map<String, dynamic> json) {
    return UserCodiList(
      codiId: json["codiId"],
      codiPhotoId: json["codiPhotoId"],
      photoName: json["photoName"],
      base64: json["base64"],
      codiPhoto: json["codiPhoto"],
    );
  }
}
