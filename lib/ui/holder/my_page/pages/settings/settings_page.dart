// 설정 페이지
import 'package:final_project_team02/ui/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/settings_body.dart';

class SettingsPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        home: Icons.home,
        setting: Icons.settings,
        cart: null,
      ),
      body: SettingsBody(),
    );
  }
}
