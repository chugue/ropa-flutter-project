import 'package:intl/intl.dart';

class Item {
  final int itemId;
  final String price;
  final String brandName;
  final String itemName;
  final int? discountPrice;
  final String finalPrice;

  const Item({
    required this.itemId,
    required this.itemName,
    required this.price,
    required this.discountPrice,
    required this.finalPrice,
    required this.brandName,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    final formatter = NumberFormat('#,###');

    return Item(
      itemId: json["itemId"],
      itemName: json["itemName"] ?? '',
      brandName: json["brandName"] ?? '',
      discountPrice: json["discountPrice"],
      price: formatter.format(json["price"]),
      finalPrice: formatter.format(json["finalPrice"]),
    );
  }
}
