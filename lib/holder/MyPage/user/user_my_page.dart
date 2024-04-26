import 'package:flutter/material.dart';

import '../../../components/custom_app_bar.dart';
import '../creator/components/creator_my_page_header.dart';
import 'components/user_my_page_body.dart';
import 'components/user_my_page_bottom.dart';
import 'components/user_my_page_header.dart';

class UserMyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(miconRight: Icons.home, miconLeft: Icons.settings),
      backgroundColor: Colors.white,
      body: UserMyPageBody(),
    );
  }
}

