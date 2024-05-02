import 'package:flutter/material.dart';

class CodiInsertTitle extends StatelessWidget {
  const CodiInsertTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "이제 더 멋지게 \n스타일을 완성해주세요!",
      style: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
