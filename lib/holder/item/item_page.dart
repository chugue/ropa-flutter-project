import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  bool isDetailShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // TODO: Empty AppBar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset("assets/images/item/item_01.png"),
                  // TODO: 아이템 더미 만들기.
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "assets/images/ropa_logo.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "ROPA",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: Row(
                children: [
                  Text(
                    '20%',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '40,000원',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '50,000원',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '반팔티',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDetailShown = !isDetailShown /* 클릭 시 !=  */;
                  });
                },
                child: Text(isDetailShown ? '접기' : '더 보기'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            if (isDetailShown) ...[
              Image.asset(
                "assets/images/item/item_01.png",
                height: 300,
                fit: BoxFit.contain,
              ),
            ],
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      "구매하기",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '고객센터 051-912-1000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        FontAwesome.chevron_right,
                        size: 16,
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '상담 오전 9시 ~ 오후 5시 (주말 공휴일 휴무)',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '점심 오후 12시 ~ 오후 1시',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
