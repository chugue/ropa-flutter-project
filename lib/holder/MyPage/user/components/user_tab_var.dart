import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTabBar extends StatelessWidget {
  const UserTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(icon: Icon(CupertinoIcons.circle_grid_3x3_fill)),
        Tab(icon: Icon(Icons.meeting_room_rounded)),
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
