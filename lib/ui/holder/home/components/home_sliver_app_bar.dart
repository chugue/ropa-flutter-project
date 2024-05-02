import 'package:flutter/material.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: Row(
        children: [
          SizedBox(
            child: Image.asset(
              "assets/images/ropa_home_logo.png",
              width: 120,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
          ),
        ),
        SizedBox(width: 16),
      ],
    );
    ;
  }
}
