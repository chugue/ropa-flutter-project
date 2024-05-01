import 'package:flutter/cupertino.dart';

class BottomControlWithButton extends StatelessWidget {
  String text;

  BottomControlWithButton({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        alignment: Alignment.bottomCenter, // 스택 내에서 위젯들을 위쪽 중앙에 정렬
        children: [],
      ),
    );
  }
}
