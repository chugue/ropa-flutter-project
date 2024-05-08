class OtherCodiPhotos {
  final int codiPhotoId;
  final String codiPhotoName;
  final String codiPhotoPath;

  const OtherCodiPhotos({
    required this.codiPhotoId,
    required this.codiPhotoName,
    required this.codiPhotoPath,
  });

  factory OtherCodiPhotos.fromJson(Map<String, dynamic> json) {
    return OtherCodiPhotos(
      codiPhotoId: json["codiPhotoId"],
      codiPhotoName: json["codiPhotoName"],
      codiPhotoPath: json["codiPhotoPath"],
    );
  }
//
}
