import 'dart:convert';

import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:final_project_team02/ui/holder/my_page/_components/my_page_custom_button.dart';
import 'package:final_project_team02/ui/holder/my_page/_components/my_page_order_mileage.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:flutter/material.dart';

class CreatorTop extends StatelessWidget {
  final CreatorModel model;

  CreatorTop({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 30),

          // ✅ 사용자 정보 창
          _buildCreatorPic(),
          SizedBox(height: 20),

          // ✅ 사용자 코맨트
          _buildCreatorComment(),
          SizedBox(height: 20),

          // ✅ 프로필 설정 버튼
          MyPageCustomButton(title: "프로필 설정"),
          SizedBox(height: 20),

          // ✅ 주문, 마일리지
          MyPageOrderMileage(orderId: 10, mileageId: 200),

          // ✅ 문의하기 버튼
          // InquiryButton()
        ],
      ),
    );
  }

  Row _buildCreatorComment() {
    return Row(
      children: [
        Column(
          children: [
            // Text('어깨 넓은 보통 체형', style: textTheme().headlineSmall),
            Text(
              model.user.introMsg,
              style: textTheme().headlineSmall,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildCreatorPic() {
    return Row(
      children: [
        // ✅ 사용자 사진
        SizedBox(
          width: 65,
          height: 65,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.5),
            child: Image.memory(
              Base64Decoder().convert(model.user.base64),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),

        // ✅ 사용자 개인정보
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(model.user.nickName,
                    // "Kenneth",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Icon(
                  Icons.verified,
                  color: Colors.blueAccent,
                ),
              ],
            ),
            Text(
                // "${model!.user.height} • ${model!.user.weight} • ${model!.user.job}",
                "${model.user.height} • ${model.user.weight} • ${model.user.job}",
                // "185cm - 80kg - 직장인",
                style: textTheme().bodyMedium),
          ],
        ),
      ],
    );
  }
}
