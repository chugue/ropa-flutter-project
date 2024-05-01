import 'package:flutter/material.dart';

class ButAddressTabBarViewInputSmallTitle extends StatelessWidget {
  final String text;

  const ButAddressTabBarViewInputSmallTitle({
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
