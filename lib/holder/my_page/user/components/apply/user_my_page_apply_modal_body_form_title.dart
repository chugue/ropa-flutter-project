import 'package:final_project_team02/holder/main/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserMyPageApplyModalFormTitle extends StatelessWidget {
  const UserMyPageApplyModalFormTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("크리에이터 지원하기",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold));
  }
}
