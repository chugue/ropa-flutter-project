class ItemPhoto {
  final int itemsId;
  final String itemName;
  final String itemDescription;
  final int itemPrice;
  final int photoId;
  final String photoPath;

  const ItemPhoto({
    required this.itemsId,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.photoId,
    required this.photoPath,
  });

  factory ItemPhoto.fromJson(Map<String, dynamic> json) {
    return ItemPhoto(
      itemsId: json["itemsId"],
      itemName: json["itemName"],
      itemDescription: json["itemDescription"],
      itemPrice: json["itemPrice"],
      photoId: json["photoId"],
      photoPath: json["photoPath"],
    );
  }
//
}
