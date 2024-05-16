import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

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
        width: double.infinity,
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
