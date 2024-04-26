import 'package:final_project_team02/holder/welcome/login/components/login_page_from.dart';
import 'package:flutter/material.dart';

import '../../../_core/constants/theme.dart';
import '../../../components/Logo.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_form_field.dart';
import '../../../_core/uitll/validate.dart';
import '../join/join_page.dart';
import 'components/login_page_body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(miconRight: Icons.home, miconLeft: Icons.settings),
      backgroundColor: Colors.white,
      body: LoginPageBody(),
    );
  }


}

