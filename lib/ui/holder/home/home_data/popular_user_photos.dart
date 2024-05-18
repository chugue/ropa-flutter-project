class PopularUserPhotos {
  final int photoId;
  final int creatorId;
  final String name;
  final String photoPath;
  final String sort;

  const PopularUserPhotos({
    required this.photoId,
    required this.creatorId,
    required this.name,
    required this.photoPath,
    required this.sort,
  });

  factory PopularUserPhotos.fromJson(Map<String, dynamic> json) {
    return PopularUserPhotos(
      photoId: json["photoId"],
      creatorId: json["creatorId"],
      name: json["name"],
      photoPath: json["photoPath"] ?? '',
      sort: json["sort"],
    );
  }
//

//
}
