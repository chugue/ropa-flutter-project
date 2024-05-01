import 'package:final_project_team02/ui/components/custom_app_bar.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_body.dart';
import 'package:flutter/material.dart';

class CreatorMyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        home: Icons.home,
        setting: Icons.settings,
        cart: null,
      ),
      backgroundColor: Colors.white,
      body: CreatorBody(),
    );
  }
}
