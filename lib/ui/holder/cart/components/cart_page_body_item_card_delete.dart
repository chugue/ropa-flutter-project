import 'package:flutter/material.dart';

class CartPageBodyItemCardDelete extends StatelessWidget {
  const CartPageBodyItemCardDelete({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {},
        child: Text("삭제"));
  }
}
