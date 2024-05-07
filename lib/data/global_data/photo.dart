class Photo {
  final int photoId;
  final String name;
  final String path;
  final String sort;

  const Photo({
    required this.photoId,
    required this.name,
    required this.path,
    required this.sort,
  });

  Photo.fromJson(Map<String, dynamic> json)
      : photoId = json["photoId"],
        name = json["name"],
        path = json["path"],
        sort = json["sort"];

//
}
