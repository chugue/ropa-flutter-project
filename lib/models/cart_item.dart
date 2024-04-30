class CartItem {
  final String itemName;
  final String delivery;
  final double itemPrice;
  final int Quantity;

  CartItem({
    required this.itemName,
    required this.delivery,
    required this.itemPrice,
     this.Quantity = 1,
  });

  final List<CartItem> cartItems = [
    CartItem(itemName: "상의",delivery: "[무료] / 기본배송",itemPrice: 35200),
    CartItem(itemName: "상의1",delivery: "[무료] / 기본배송",itemPrice: 35200),
    CartItem(itemName: "상의2",delivery: "[무료] / 기본배송",itemPrice: 35200),
    CartItem(itemName: "상의3",delivery: "[무료] / 기본배송",itemPrice: 35200),
    CartItem(itemName: "상의4",delivery: "[무료] / 기본배송",itemPrice: 35200),
    CartItem(itemName: "상의5",delivery: "[무료] / 기본배송",itemPrice: 35200),
  ];


}