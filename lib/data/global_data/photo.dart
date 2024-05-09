class PhotoDTO {
  final int id;
  final String name;
  final String path;

  PhotoDTO({
    required this.id,
    required this.name,
    required this.path,
  });

  PhotoDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        path = json["path"];
}
