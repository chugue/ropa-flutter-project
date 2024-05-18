class ItemList {
  int itemId;
  String name;
  String description;
  int price;
  int itemPhotoId;
  String itemPhotoName;
  String photoPath;
  String itemPhoto;

  ItemList({
    required this.itemId,
    required this.name,
    required this.description,
    required this.price,
    required this.itemPhotoId,
    required this.itemPhotoName,
    required this.photoPath,
    required this.itemPhoto,
  });

  factory ItemList.fromJson(Map<String, dynamic> json) {
    return ItemList(
      itemId: json["itemId"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      itemPhotoId: json["itemPhotoId"],
      itemPhotoName: json["itemPhotoName"],
      photoPath: json["photoPath"],
      itemPhoto: json["itemPhoto"],
    );
  }
}
