import 'package:final_project_team02/holder/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

class MainHolder extends StatelessWidget {
  const MainHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WelcomePage(),
    );
  }
}
