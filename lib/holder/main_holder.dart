import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class MainHolder extends StatelessWidget {
  const MainHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Icon(CupertinoIcons.chevron_left),
          toolbarHeight: 45,
        ),
        body: ListView(
          children: [
            Container(
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
                        color: Colors.black87
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ), // 예를 들어, 주소 결과를 출력
      ),
    );
  }
}
