import 'package:flutter/cupertino.dart';

import 'package:final_project_team02/holder/main/components/positioned_button.dart';
import 'package:final_project_team02/components/bottom_control.dart';

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
        children: [
          BottomControl(),
          PositionedButton(text: text),
        ],
      ),
    );
  }
}
