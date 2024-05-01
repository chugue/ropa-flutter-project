import 'package:flutter/material.dart';

class SearchTabBar extends StatelessWidget {
  const SearchTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Text(
          "코디",
          style: TextStyle(fontSize: 25),
        ),
        Text(
          "아이템",
          style: TextStyle(fontSize: 25),
        ),
      ],
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3.0, // 밑줄의 두께 설정
          ),
        ),
      ),
    );
  }
}
