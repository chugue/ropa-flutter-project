import 'package:flutter/material.dart';

import 'MyPage/creator/creator_page.dart';

class MainHolder extends StatelessWidget {
  const MainHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CreatorPage(),
    );
  }
}
