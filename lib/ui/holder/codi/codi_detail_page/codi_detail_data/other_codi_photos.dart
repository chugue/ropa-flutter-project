class OtherCodiPhotos {
  final int codiPhotoId;
  final int codiId;
  final String codiPhotoName;
  final String codiPhotoPath;
  final bool isMainPhoto = true;

  const OtherCodiPhotos({
    required this.codiPhotoId,
    required this.codiId,
    required this.codiPhotoName,
    required this.codiPhotoPath,
  });

  factory OtherCodiPhotos.fromJson(Map<String, dynamic> json) {
    return OtherCodiPhotos(
      codiPhotoId: json["codiPhotoId"],
      codiId: json["codiId"],
      codiPhotoName: json["codiPhotoName"],
      codiPhotoPath: json["codiPhotoPath"],
    );
  }
//
}
