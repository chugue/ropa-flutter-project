import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


class CartPageBodyItemCardDetailQuantity extends StatelessWidget {
  const CartPageBodyItemCardDetailQuantity({
    super.key,
    required int quantity,
  }) : _quantity = quantity;

  final int _quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {

          },
          child: const Icon(Icons.remove),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('$_quantity'),
        ),
        TextButton(
          onPressed: () {

          },
          child: const Icon(Icons.add),
        ),
        Text("수량"),
      ],
    );
  }
}
