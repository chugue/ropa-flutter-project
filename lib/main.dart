import 'package:final_project_team02/theme.dart';
import 'package:flutter/material.dart';

import 'holder/main/home_page.dart';
import 'holder/main_hoder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MainHolder(),
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
      },
    );
  }
}
