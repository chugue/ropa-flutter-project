import 'package:final_project_team02/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'holder/buy/_address_tab.dart';

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
      home: Scaffold(
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
      ),
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
