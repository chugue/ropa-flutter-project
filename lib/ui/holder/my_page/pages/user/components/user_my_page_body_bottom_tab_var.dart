import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserTabBar extends StatelessWidget {
  const UserTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          icon: Icon(
            CupertinoIcons.square_grid_2x2_fill,
            size: 32,
          ),
        ),
        Tab(icon: Icon(FontAwesomeIcons.shirt)),
      ],
      indicator: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        border: Border(
          bottom: BorderSide(
            width: 3.0, // 밑줄의 두께 설정
          ),
        ),
      ),
      indicatorSize: TabBarIndicatorSize.tab, // 아래 줄의 가로 길이를 탭의 가로 길이에 맞춤
    );
  }
}
