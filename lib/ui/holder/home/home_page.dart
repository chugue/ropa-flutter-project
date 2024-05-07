import 'package:final_project_team02/ui/holder/home/components/home_app_bar.dart';
import 'package:final_project_team02/ui/holder/home/components/home_sliver_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //메인 광고 사진 오토
    return Scaffold(
      appBar: HomeAppbar(),
      body: HomeBody(), // body: SettingsPage(),
    );
  }
}

