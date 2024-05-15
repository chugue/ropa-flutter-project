import 'package:final_project_team02/ui/holder/buy/buy_data/item_photo.dart';

class CartInfos {
  final int cartId;
  final int itemId;
  final String itemName;
  final String size;
  final int quantity;
  final int price;
  final int amount;
  final ItemPhoto itemPhoto;

  factory CartInfos.fromJson(Map<String, dynamic> json) {
    return CartInfos(
        cartId: json["cartId"],
        itemId: json["itemId"],
        itemName: json["itemName"],
        size: json["size"],
        quantity: json["quantity"],
        price: json["price"],
        amount: json["amount"],
        itemPhoto: ItemPhoto.fromJson(json["itemPhoto"]));
  }

  const CartInfos({
    required this.cartId,
    required this.itemId,
    required this.itemName,
    required this.size,
    required this.quantity,
    required this.price,
    required this.amount,
    required this.itemPhoto,
  }); //
}
