import 'package:flutter/material.dart';

import '../holder/welcome/welcome_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData micon;

  const CustomAppBar({required this.micon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextButton(
        onPressed: () {
          Navigator.pop(
              context, MaterialPageRoute(builder: (context) => WelcomePage()));
        },
        child: Icon(micon),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
