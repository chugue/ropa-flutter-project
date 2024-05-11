class Item{
  final int itemId;
  final int price;
  final String discountRate;
  final int discountPrice;
  final bool isMainPhoto;
  final String sort;
  final String brandName;

  const Item({
    required this.itemId,
    required this.price,
    required this.discountRate,
    required this.discountPrice,
    required this.isMainPhoto,
    required this.sort,
    required this.brandName,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemId: json["itemId"],
      price: json["price"],
      discountRate: json["discountRate"] ?? '',
      discountPrice:json["discountPrice"],
      isMainPhoto: json["isMainPhoto"],
      sort: json["sort"] ?? null,
      brandName: json["brandName"],);
  }

}