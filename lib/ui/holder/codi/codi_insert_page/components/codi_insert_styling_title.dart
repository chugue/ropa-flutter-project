import 'package:flutter/material.dart';

class StylingTitle extends StatelessWidget {
  const StylingTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 30,
      minLines: 1,
      decoration: InputDecoration(
        hintText: "스타일링 포인트는 무엇인가요?",
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        // 상하 여백 조절
        hintStyle: TextStyle(color: Colors.grey), // hintText의 위치 조절
      ),
    );
  }
}
