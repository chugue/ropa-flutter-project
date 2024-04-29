import 'package:flutter/material.dart';

class OrderPageBodyTitle extends StatelessWidget {
  final String title;

  OrderPageBodyTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "${title}",
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
