import 'package:final_project_team02/_core/constants/size.dart';
import 'package:flutter/material.dart';

import '../../../../_core/constants/theme.dart';
import '../../components/custom_app_bar.dart';
import '../../components/logo.dart';
import '../../components/welcome_button.dart';
import 'join/join_page.dart';
import 'login/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        home: Icons.home,
        setting: Icons.settings,
        cart: null,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: xlargeGap),
          Logo(width: 500, height: 500),
          Row(
            children: [
              Expanded(
                child: WelcomeButton(
                  buttonText: '로그인',
                  onTap: LoginPage(),
                  color: lightColorScheme.primary,
                  textColor: Colors.white,
                ),
              ),
              Expanded(
                child: WelcomeButton(
                  buttonText: '회원가입',
                  onTap: JoinPage(),
                  color: lightColorScheme.primary,
                  textColor: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
