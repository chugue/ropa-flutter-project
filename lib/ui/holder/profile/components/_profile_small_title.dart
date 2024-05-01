import 'package:flutter/material.dart';

class ProfileSmallTitle extends StatelessWidget {
  final String text;

  const ProfileSmallTitle({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w900,
          color: Colors.black26,
        ),
      ),
    );
  }
}
