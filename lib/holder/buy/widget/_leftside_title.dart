import 'package:flutter/cupertino.dart';

import '_small_title.dart';

class LeftSideTitle extends StatelessWidget {
  const LeftSideTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallTitle(text: "받는사람"),
            SizedBox(height: 38),
            SmallTitle(text: "주소"),
            SizedBox(height: 140),
            SmallTitle(text: "휴대전화"),
            SizedBox(height: 38),
            SmallTitle(text: "이메일"),
          ],
        ),
      ),
    );
  }
}
