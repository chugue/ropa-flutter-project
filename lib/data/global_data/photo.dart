class PhotoDTO {
  final int id;
  final String name;
  final String photoPath;

  PhotoDTO({
    required this.id,
    required this.name,
    required this.photoPath,
  });

  PhotoDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        photoPath = json["photoPath"];
}
