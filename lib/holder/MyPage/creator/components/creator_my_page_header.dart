import 'package:flutter/material.dart';

import '../../_components/my_page_custom_button.dart';
import '../../_components/my_page_order_mileage.dart';
import '../../../../theme.dart';

class CreatorMyPageheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 30),
          _buildCreatorPic(),
          SizedBox(height: 20),
          MyPageCustomButton(title: "프로필 설정"),
          SizedBox(height: 20),
          MyPageOrderMileage(orderId: 10, mileageId: 200),
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
            Text('180cm • 70kg • 직장인',
                style: textTheme().bodyMedium), // :TODO 04수정
          ],
        ),
      ],
    );
  }
}

