import 'package:final_project_team02/theme.dart';
import 'package:flutter/material.dart';

import 'holder/main/main_holder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MainHolder(),
    );
  }
}
