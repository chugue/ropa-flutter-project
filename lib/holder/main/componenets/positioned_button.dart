import 'package:flutter/cupertino.dart';

import '../../../components/bottom_button.dart';

class PositionedButton extends StatelessWidget {
  const PositionedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60,
      child: BottomButton(),
    );
  }
}
