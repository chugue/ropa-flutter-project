import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomControl extends StatelessWidget {
  const BottomControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
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
