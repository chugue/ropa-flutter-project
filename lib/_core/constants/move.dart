import 'package:flutter/cupertino.dart';

import '../../holder/welcome/join/join_page.dart';
import '../../holder/welcome/login/login_page.dart';

class Move {
  static String loginPage = "/login";
  static String joinPage = "/join";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (context) => const LoginPage(),
    Move.joinPage: (context) => const JoinPage(),
  };
}
