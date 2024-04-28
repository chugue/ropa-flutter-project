import 'package:flutter/material.dart';
import '../../../components/custom_app_bar.dart';
import 'components/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(miconRight: Icons.home, miconLeft: Icons.settings),
      backgroundColor: Colors.white,
      body: LoginPageBody(),
    );
  }
}

