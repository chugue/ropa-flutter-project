import 'package:flutter/material.dart';

class MoreStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Icon(
                Icons.add_circle,
                size: 24,
                color: Colors.black,
              ),
              SizedBox(width: 8),
              Text(
                "더 많은 스타일!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
