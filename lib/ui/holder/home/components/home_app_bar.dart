import 'package:final_project_team02/_core/constants/move.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_page.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          SizedBox(
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Move.mainHoder, (_) => false);
              },
              child: Image.asset(
                "assets/images/ropa_home_logo.png",
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
            Icons.notifications,
          ),
        ),
        SizedBox(width: 16),
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CodiInsertPage(),
                ));
          },
          icon: Icon(Icons.add_circle),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
