import 'package:final_project_team02/ui/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/creator_view_body.dart';

class CreatorPage extends StatelessWidget {
  const CreatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(home: Icons.home, cart: null, setting: Icons.settings),
      backgroundColor: Colors.white,
      body: CreatorViewBody(),
    );
  }
}
