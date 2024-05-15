
class CartSaveDTO{
 final int itemId;
 final int quantity;

 const CartSaveDTO({
    required this.itemId,
    required this.quantity,
  });

 Map<String, dynamic> toJson() {
    return {
      "itemId": this.itemId,
      "quantity": this.quantity,
    };
  }
}