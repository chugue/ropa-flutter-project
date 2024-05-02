import 'package:flutter/material.dart';

import '../../../../components/logo.dart';
import 'login_from.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Logo(width: 250, height: 250),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: LoginFrom(),
          ),
        ),
      ],
    );
  }
}
