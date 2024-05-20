class CartSaveDTO {
  final int itemId;
  final int quantity;
  final int codiId;

  const CartSaveDTO({
    required this.itemId,
    required this.quantity,
    required this.codiId,
  });

  Map<String, dynamic> toJson() {
    return {
      "itemId": this.itemId,
      "quantity": this.quantity,
      "codiId": this.codiId,
    };
  }
}
