import 'package:flutter/material.dart';

class SmallTitle extends StatelessWidget {
  final String text;

  const SmallTitle({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
