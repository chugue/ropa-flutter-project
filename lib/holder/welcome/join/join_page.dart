import 'package:flutter/material.dart';
import '../../../components/custom_app_bar.dart';
import 'components/join_page_body.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(home: Icons.home, setting: Icons.settings,cart: null,),
      backgroundColor: Colors.white,
      body: join_page_body(),
    );
  }
}
