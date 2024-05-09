class PopularCodiPhotos {
  final int photoId;
  final int codiId;
  final String name;
  final String path;
  final String base64;
  final String sort;
  final bool isMainPhoto;

  const PopularCodiPhotos({
    required this.photoId,
    required this.base64,
    required this.codiId,
    required this.name,
    required this.path,
    required this.sort,
    required this.isMainPhoto,
  });

  factory PopularCodiPhotos.fromJson(Map<String, dynamic> json) {
    return PopularCodiPhotos(
      photoId: json["photoId"],
      base64: json["base64"],
      codiId: json["codiId"],
      name: json["name"],
      path: json["path"],
      sort: json["sort"],
      isMainPhoto: json["isMainPhoto"],
    );
  }
//
}
