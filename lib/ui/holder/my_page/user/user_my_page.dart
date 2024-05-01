import 'package:flutter/material.dart';

import '../../../components/custom_app_bar.dart';
import 'components/user_my_page_body.dart';

class UserMyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        home: Icons.home,
        setting: Icons.settings,
        cart: Icons.shopping_basket,
      ),
      backgroundColor: Colors.white,
      body: UserMyPageBody(),
    );
  }
}
