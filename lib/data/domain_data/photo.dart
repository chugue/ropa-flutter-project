class Photo {
  final int id;
  final String name;
  final String path;

  Photo({
    required this.id,
    required this.name,
    required this.path,
  });

  Photo.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        path = json["path"];
}
