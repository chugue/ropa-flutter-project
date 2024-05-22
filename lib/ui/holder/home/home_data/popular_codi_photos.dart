class PopularCodiPhotos {
  final int photoId;
  final int? userId;
  final int codiId;
  final String name;
  final String photoPath;
  final String sort;
  final bool? isMainPhoto;

  const PopularCodiPhotos({
    required this.photoId,
    required this.userId,
    required this.codiId,
    required this.name,
    required this.photoPath,
    required this.sort,
    required this.isMainPhoto,
  });

  factory PopularCodiPhotos.fromJson(Map<String, dynamic> json) {
    return PopularCodiPhotos(
      photoId: json["photoId"],
      userId: json["userId"] ?? null,
      codiId: json["codiId"],
      name: json["name"] ?? '',
      photoPath: json["photoPath"] ?? '',
      sort: json["sort"] ?? '',
      isMainPhoto: json["isMainPhoto"],
    );
  }
//
}
