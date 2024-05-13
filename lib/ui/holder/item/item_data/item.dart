import 'package:intl/intl.dart';

class Item {
  final int itemId;
  final String price; // Store price as a formatted string
  final String brandName;
  final String itemName; // Store price as a formatted string
  final int? discountPrice; // Store price as a formatted string
  final String finalPrice; // Store price as a formatted string

  const Item({
    required this.itemId,
    required this.itemName,
    required this.price,
    this.discountPrice,
    required this.finalPrice,
    required this.brandName,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    final formatter = NumberFormat('#,###'); // Create a formatter
    return Item(
      itemId: json["itemId"],
      itemName: json["itemName"] ?? '',
      brandName: json["brandName"] ?? '',
      discountPrice: json["discountRate"] ?? null,

      // Safely parse to double, handle null

      price: formatter.format(json["price"]),
      finalPrice: formatter.format(json["finalPrice"]),
    );
  }
}
