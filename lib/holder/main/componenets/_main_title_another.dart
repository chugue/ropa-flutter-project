import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTitleAnother extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              "인기 제품",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "(기준 판매량)",
              style: TextStyle(fontSize: 12.0),
            )
          ],
        ),
      ),
    );
  }
}
