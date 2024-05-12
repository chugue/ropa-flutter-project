import 'package:final_project_team02/_core/constants/move.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Move.mainHolder, (route) => false);
            },
            child: SizedBox(
              child: Image.asset(
                "assets/images/ropa_home_logo.png",
                width: 120,
              ),
            ),
          ),
        ],
      ),
      actions: [
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     CupertinoIcons.ellipsis,
        //     size: 30,
        //   ),
        // ),
        // SizedBox(width: 16),
      ],
    );
  }
}
