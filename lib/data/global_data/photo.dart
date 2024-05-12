class PhotoDTO {
  final int id;
  final String name;
  final String base64;

  PhotoDTO({
    required this.id,
    required this.name,
    required this.base64,
  });

  PhotoDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        base64 = json["base64"];
}
