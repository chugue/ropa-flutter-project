import 'package:flutter/material.dart';

class CodiCreatedAt extends StatelessWidget {
  const CodiCreatedAt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          "2024.04.28",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
