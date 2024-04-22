

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/Logo.dart';
import '../../components/welcome_button.dart';
import '../../size.dart';
import '../../theme.dart';
import 'join/join_page.dart';
import 'login/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: xlargeGap),
          Logo(width: 500, height: 500),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: WelcomeButton(
                    buttonText: '로그인',
                    onTap: Loginpage(),
                    color: lightColorScheme.primary,
                    textColor: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: WelcomeButton(
                  buttonText: '회원가입',
                  onTap: joinPage(),
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
