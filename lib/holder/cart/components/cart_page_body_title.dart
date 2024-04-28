
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


class CartPageBodyTitle extends StatelessWidget {
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${title}",
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  const CartPageBodyTitle({
    required this.title,
  });
}