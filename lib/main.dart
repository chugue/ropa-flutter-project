import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/_core/constants/move.dart';
import 'package:final_project_team02/ui/holder/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '_core/constants/theme.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  dio.interceptors.add(interceptor);
  runApp(ProviderScope(child: const MyApp()));
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
      home: SplashPage(),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      // initialRoute: Move.mainHolder,
      routes: getRouters(),
    );
  }
}
