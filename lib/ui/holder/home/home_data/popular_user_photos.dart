class PopularUserPhotos {
  final int photoId;
  final int creatorId;
  final String name;
  final String base64;
  final String sort;

  const PopularUserPhotos({
    required this.photoId,
    required this.creatorId,
    required this.name,
    required this.base64,
    required this.sort,
  });

  factory PopularUserPhotos.fromJson(Map<String, dynamic> json) {
    return PopularUserPhotos(
      photoId: json["photoId"],
      creatorId: json["creatorId"],
      name: json["name"],
      base64: json["base64"] ?? '',
      sort: json["sort"],
    );
  }
//

//
}
