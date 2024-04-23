import 'package:final_project_team02/holder/profile/profile_setting.dart';
import 'package:flutter/material.dart';

class MainHolder extends StatelessWidget {
  const MainHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProfileSetting(),
    );
  }
}
// Scaffold(
// appBar: AppBar(
// elevation: 0,
// leading: Icon(CupertinoIcons.chevron_left),
// toolbarHeight: 45,
// ),
// bottomNavigationBar: Padding(
// padding: const EdgeInsets.all(10),
// child: BottomControl(),
// ),
// )
