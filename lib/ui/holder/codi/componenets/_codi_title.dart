import 'package:flutter/material.dart';

class CodiTitle extends StatelessWidget {
  final String title; // String 파라미터를 저장할 변수 추가

  const CodiTitle({
    Key? key,
    required this.title, // title 파라미터 추가
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 16.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ), // 폰트 사이즈 30 설정
        ),
      ),
    );
  }
}
