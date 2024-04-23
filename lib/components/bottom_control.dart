import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomControl extends StatelessWidget {
  const BottomControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // 바텀 네비게이션바의 높이
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home),
            Icon(CupertinoIcons.bag),
            Icon(CupertinoIcons.person_fill),
          ],
        ),
      ),
    );
  }
}
