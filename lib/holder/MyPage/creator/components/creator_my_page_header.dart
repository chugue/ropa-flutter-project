import 'package:final_project_team02/holder/MyPage/user/components/user_my_page_order_mileage.dart';
import 'package:final_project_team02/holder/MyPage/user/user_my_page.dart';
import 'package:flutter/material.dart';

import '../../../../components/custom_button.dart';
import '../../../../theme.dart';

class MyPageheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 30),
          user_my_page_pic(),
          SizedBox(height: 20),
          custom_button(title: "프로필 설정"),
          SizedBox(height: 20),
          UserMyPageOrderMileage(orderId: 10, mileageId: 200),
        ],
      ),
    );
  }
}

