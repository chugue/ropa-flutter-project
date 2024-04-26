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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 20),
          SmallTitle(text: "받는사람"),
          SizedBox(height: 50),
          SmallTitle(text: "주소"),
          SizedBox(height: 130),
          SmallTitle(text: "휴대전화"),
          SizedBox(height: 40),
          SmallTitle(text: "이메일"),
        ],
      ),
    );
  }
}
