import 'package:flutter/material.dart';

class CartPageBodyItemCardOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade500),
      ),
      onPressed: () {

      },
      child: Text("주문하기"),
    );
  }
}
