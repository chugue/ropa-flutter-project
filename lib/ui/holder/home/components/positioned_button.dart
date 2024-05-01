import 'package:flutter/cupertino.dart';

import '../../../components/bottom_button.dart';

class PositionedButton extends StatelessWidget {
  String text;

  PositionedButton({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      right: 10,
      bottom: 60,
      child: BottomButton(text: text),
    );
  }
}
