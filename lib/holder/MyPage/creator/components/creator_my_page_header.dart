import 'package:final_project_team02/holder/MyPage/user/components/order_mileage.dart';
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
          _buildCreatorPic(),
          SizedBox(height: 20),
          custom_button(title: "프로필 설정"),
          SizedBox(height: 20),
          OrderMileage(orderId: 10, mileageId: 200),
        ],
      ),
    );
  }

  Widget _buildCreatorPic() {
    return Row(
      children: [
        SizedBox(
          width: 65,
          height: 65,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.5),
            child: Image.network(
              'https://picsum.photos/200/100', // :TODO 04 사진수정
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('회원 이름', style: textTheme().displayMedium), // :TODO 04수정
          ],
        ),
      ],
    );
  }

  Widget _buildCreatorComment() {
    return Row(
      children: [
        Column(
          children: [
            Text('어깨 넓은 보통 체형', style: textTheme().headlineSmall),
            Text('어깨 넓은 보통 체형', style: textTheme().headlineSmall),
            Text('어깨 넓은 보통 체형', style: textTheme().headlineSmall),
          ],
        ),
      ],
    );
  }
}
