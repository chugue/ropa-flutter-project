import 'package:final_project_team02/theme.dart';
import 'package:flutter/material.dart';

import 'holder/buy/buy_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This components is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: BuyPage(),
    );
  }
}
