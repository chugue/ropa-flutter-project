import 'package:final_project_team02/ui/holder/main_holder.dart';
import 'package:flutter/cupertino.dart';
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
              print("로고 클릭 됨");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainHolder(),
                ),
              );
            },
            child: SizedBox(
              child: Image.asset(
                "assets/images/ropa_logo.png",
                width: 120,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.ellipsis,
            size: 30,
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
