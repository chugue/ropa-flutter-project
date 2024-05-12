import 'package:intl/intl.dart';

class Item{
  final int itemId;
  final String price; // Store price as a formatted string
  final String brandName;
  final String itemName; // Store price as a formatted string
  final double? discountRate;
  final String discountPrice;

  const Item({
    required this.itemId,
    required this.itemName,
    required this.price,
    this.discountRate,
    required this.discountPrice,
    required this.brandName,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    final formatter = NumberFormat('#,###'); // Create a formatter
    return Item(
      itemId: json["itemId"],
      itemName: json["itemName"] ?? '',
      brandName: json["brandName"] ?? '',
      discountRate: json["discountRate"] != null ? double.tryParse(json["discountRate"].toString()) : null, // Safely parse to double, handle null

      price: formatter.format(json["price"]),
      discountPrice: formatter.format(json["discountPrice"]),
    );
  }
}
