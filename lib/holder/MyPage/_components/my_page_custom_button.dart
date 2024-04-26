import 'package:flutter/material.dart';

import '../../profile/profile_page.dart';
import '../../../theme.dart';

class MyPageCustomButton extends StatelessWidget {
  const MyPageCustomButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileSetting()));
      },
      child: Container(
        width: 400,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
        ),
        child: Align(
          child: Text(
            '${title}', // :TODO 04수정 (오타)
            style: textTheme().titleMedium, // :TODO 04수정
          ),
        ),
      ),
    );
  }
}
