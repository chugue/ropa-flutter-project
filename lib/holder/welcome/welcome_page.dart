import 'package:flutter/material.dart';

import '../../components/Logo.dart';
import '../../components/custom_app_bar.dart';
import '../../components/welcome_button.dart';
import '../../_core/constants/size.dart';
import '../../../../_core/constants/theme.dart';
import 'join/join_page.dart';
import 'login/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(miconRight: Icons.home, miconLeft: Icons.settings),
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
