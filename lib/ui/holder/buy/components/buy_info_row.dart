import 'package:flutter/material.dart';

class BuyInfoRow extends StatelessWidget {
  String name;
  String price;
  Color colors;

  BuyInfoRow({
    required this.name,
    required this.price,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${name}",
          style: TextStyle(color: Colors.black),
        ),
        Container(
          child: Row(
            children: [
              Text(
                "${price}",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16, color: colors),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
