import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPageBodyItemCardDelete extends ConsumerWidget {
  final int cartId;

  const CartPageBodyItemCardDelete({
    required this.cartId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          ref.read(cartProvider.notifier).removeItem(cartId);
        },
        child: Text("삭제"));
  }
}
