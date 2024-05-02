import 'package:flutter/material.dart';

class CartPageCustomBox extends StatelessWidget {
  final String text;

  const CartPageCustomBox({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text("${text}",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ),
      ),
    );
  }
}
