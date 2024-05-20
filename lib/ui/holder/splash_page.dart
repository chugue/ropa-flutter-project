import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> performAutoLogin() async {
      await Future.delayed(Duration(seconds: 3)); // 3초 지연
      ref.read(sessionProvider).autoLogin();
    }

    performAutoLogin(); // 지연 후 자동 로그인 수행

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/ropa_splash.gif',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
