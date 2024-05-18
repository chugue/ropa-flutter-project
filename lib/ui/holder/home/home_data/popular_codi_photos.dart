class PopularCodiPhotos {
  final int photoId;
  final int codiId;
  final String name;
  final String photoPath;
  final String sort;
  final bool isMainPhoto;

  const PopularCodiPhotos({
    required this.photoId,
    required this.codiId,
    required this.name,
    required this.photoPath,
    required this.sort,
    required this.isMainPhoto,
  });

  factory PopularCodiPhotos.fromJson(Map<String, dynamic> json) {
    return PopularCodiPhotos(
      photoId: json["photoId"],
      codiId: json["codiId"],
      name: json["name"],
      photoPath: json["photoPath"] ?? '',
      sort: json["sort"],
      isMainPhoto: json["isMainPhoto"],
    );
  }
//
}
