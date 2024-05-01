import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Icon(CupertinoIcons.chevron_left),
      toolbarHeight: 45,
    );
  }
}
