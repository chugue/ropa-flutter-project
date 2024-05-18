class CartList {
  final int cartId;
  final int itemId;
  final int quantity;
  final int itemPrice;
  final int totalItemPrice;
  final String itemName;
  final String photoPath;

  const CartList({
    required this.cartId,
    required this.itemId,
    required this.quantity,
    required this.itemName,
    required this.photoPath,
    required this.itemPrice,
    required this.totalItemPrice,
  });

  factory CartList.fromJson(Map<String, dynamic> json) {
    return CartList(
      cartId: json["cartId"],
      itemId: json["itemId"],
      quantity: json["quantity"],
      itemPrice: json["itemPrice"],
      totalItemPrice: json["totalItemPrice"],
      itemName: json["itemName"],
      photoPath: json["photoPath"],
    );
  }
//

//
// factory CartList.fromJson(Map<String, dynamic> json) {
//   final formatter = NumberFormat('#,###'); // Create a formatter
//
//   return CartList(
//     cartId: json["cartId"],
//     itemsId: json["itemId"],
//     quantity: json["quantity"],
//     itemName: json["itemName"],
//     itemPhotoBase64: json["itemPhotoBase64"],
//     itemPrice: json["itemPrice"],
//     totalItemPrice: json["totalItemPrice"],
//   );
// }
}
