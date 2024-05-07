class PopularCodiPhotos {
  final int photoId;
  final int codiId;
  final String name;
  final String path;
  final String sort;

  const PopularCodiPhotos({
    required this.photoId,
    required this.codiId,
    required this.name,
    required this.path,
    required this.sort,
  });

  factory PopularCodiPhotos.fromJson(Map<String, dynamic> json) {
    return PopularCodiPhotos(
      photoId: json["photoId"],
      codiId: json["codiId"],
      name: json["name"],
      path: json["path"],
      sort: json["sort"],
    );
  }
//
}
