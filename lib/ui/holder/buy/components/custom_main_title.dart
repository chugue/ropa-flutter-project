import 'package:flutter/material.dart';

class CustomMainTitle extends StatelessWidget {
  String text;

  CustomMainTitle({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
