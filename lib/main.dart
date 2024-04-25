import 'package:final_project_team02/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'holder/buy/_address_tab.dart';
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

class BuyPage extends StatelessWidget {
  const BuyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(CupertinoIcons.chevron_left),
        toolbarHeight: 45,
      ),
      body: ListView(
        children: [
          _pageTitle(),
          AddressTab(),
        ],
      ), // 예를 들어, 주소 결과를 출력
    );
  }
}

Widget _pageTitle() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "배송지",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87),
          ),
        ),
      ],
    ),
  );
}
