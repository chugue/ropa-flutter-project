import 'package:intl/intl.dart';

class Item {
  final int itemId;
  final String price; // Store price as a formatted string
  final String discountRate;
  final String discountPrice;
  final String sort;
  final String brandName;

  const Item({
    required this.itemId,
    required this.price,
    required this.discountRate,
    required this.discountPrice,
    required this.sort,
    required this.brandName,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    final formatter = NumberFormat('#,###'); // Create a formatter

    return Item(
      itemId: json["itemId"],
      price: formatter.format(json["price"]),
      discountRate: json["discountRate"] ?? '',
      discountPrice: formatter.format(json["discountPrice"]),
      sort: json["sort"] ?? '',
      brandName: json["brandName"],
    );
  }
}
