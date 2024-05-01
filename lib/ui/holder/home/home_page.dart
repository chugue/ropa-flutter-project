import 'package:flutter/material.dart';

import 'components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //메인 광고 사진 오토
    return Scaffold(
      body: HomeBody(), // body: SettingsPage(),
    );
  }
}
