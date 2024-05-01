import 'package:final_project_team02/ui/holder/auth/join/join_page.dart';
import 'package:final_project_team02/ui/holder/auth/login/login_page.dart';
import 'package:final_project_team02/ui/holder/port_one/components/certification.dart';
import 'package:final_project_team02/ui/holder/port_one/components/certification_result.dart';
import 'package:final_project_team02/ui/holder/port_one/components/certification_test.dart';
import 'package:final_project_team02/ui/holder/port_one/components/home.dart';
import 'package:final_project_team02/ui/holder/port_one/components/payment.dart';
import 'package:final_project_team02/ui/holder/port_one/components/payment_result.dart';
import 'package:final_project_team02/ui/holder/port_one/port_one_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Move {
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String payment = "/payment";
  static String paymentTest = "/paymentTest";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (context) => const LoginPage(),
    Move.joinPage: (context) => const JoinPage(),
    Move.payment: (context) => Payment(),
    Move.paymentTest: (context) => PaymentTest(),
  };
}

final primaryColor = Colors.blue; // primaryColor를 라우트 파일에 정의할 수도 있습니다.

List<GetPage> appRoutes = [
  GetPage(name: '/', page: () => Home()),
  GetPage(name: '/payment-test', page: () => PaymentTest()),
  GetPage(name: '/payment', page: () => Payment()),
  GetPage(name: '/payment-result', page: () => PaymentResult()),
  GetPage(name: '/certification-test', page: () => CertificationTest()),
  GetPage(name: '/certification', page: () => Certification()),
  GetPage(name: '/certification-result', page: () => CertificationResult()),
];
