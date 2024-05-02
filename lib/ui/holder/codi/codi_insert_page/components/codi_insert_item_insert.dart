import 'package:flutter/material.dart';

class ItemInsert extends StatelessWidget {
  const ItemInsert({super.key, required this.category});

  final category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 16.0),
      child: GestureDetector(
        onTap: () {
          // 상품추가 메서드 추가
          print("${category} 상품 추가 선택됨");
        },
        child: Column(
          children: [
            Container(
              child: Container(
                width: 80,
                height: 80,
                color: Colors.grey[200],
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Text(
              category,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
