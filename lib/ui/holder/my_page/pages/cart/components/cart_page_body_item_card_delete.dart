import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPageBodyItemCardDelete extends ConsumerWidget {
  const CartPageBodyItemCardDelete({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          ref.read(cartProvider.notifier).removeItem();



        },
        child: Text("삭제"));
  }
}
