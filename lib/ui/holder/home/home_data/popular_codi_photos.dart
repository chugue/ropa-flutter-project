class PopularCodiPhotos {
  final int photoId;
  final int codiId;
  final String name;
  final String base64;
  final String sort;
  final bool isMainPhoto;

  const PopularCodiPhotos({
    required this.photoId,
    required this.codiId,
    required this.name,
    required this.base64,
    required this.sort,
    required this.isMainPhoto,
  });

  factory PopularCodiPhotos.fromJson(Map<String, dynamic> json) {
    return PopularCodiPhotos(
      photoId: json["photoId"],
      codiId: json["codiId"],
      name: json["name"],
      base64: json["base64"] ?? '',
      sort: json["sort"],
      isMainPhoto: json["isMainPhoto"],
    );
  }
//
}
