

import 'package:flutter/material.dart';

class CodiItemBrandTabBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        tabs: [
          Tab(text: '브랜드 1'),
          Tab(text: '브랜드 2'),
        ],
      ),
    );
  }
  @override
  Size get preferredSize =>
      Size.fromHeight(48.0); // Adjust the height as needed
}
