import 'package:flutter/material.dart';

import '../../../../_core/constants/theme.dart';
import '../../../../_core/uitll/validate.dart';
import '../../../../components/Logo.dart';
import '../../../../components/custom_form_field.dart';
import '../../join/join_page.dart';
import 'login_page_from.dart';



class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Logo(width: 250, height: 250),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: LoginPageFrom(),
          ),
        ),
      ],
    );
  }
}
