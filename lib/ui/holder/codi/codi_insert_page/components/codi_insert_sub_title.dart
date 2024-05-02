import 'package:flutter/material.dart';

class CodiInsertSubTitle extends StatelessWidget {
  const CodiInsertSubTitle({
    super.key,
    this.subTitle,
  });

  final subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
