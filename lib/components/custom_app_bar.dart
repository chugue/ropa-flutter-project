import 'package:final_project_team02/holder/profile/settings_page.dart';
import 'package:flutter/material.dart';

import '../holder/main_hoder.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? miconRight;
  final IconData? miconLeft;

  const CustomAppBar({
    required this.miconRight,
    required this.miconLeft,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainHolder()),
                ModalRoute.withName(
                    '/home'), // '/firstPage' 라우트를 제외한 모든 페이지를 스택에서 제거
              );
            },
            child: Icon(miconRight),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            child: Icon(miconLeft),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
