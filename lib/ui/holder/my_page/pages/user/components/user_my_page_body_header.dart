import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_team02/ui/holder/my_page/_components/my_page_custom_button.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/components/my_page_order_inquiry.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_my_pageviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../_core/constants/http.dart';

class UserMyPageBodyTop extends StatelessWidget {
  final UserMyPageModel model;

  UserMyPageBodyTop({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 30),

          // ✅ 사용자 정보
          _buildUserInfo(),
          SizedBox(height: 20),

          // ✅ 프로필 설정
          MyPageCustomButton(title: "프로필 설정"),
          SizedBox(height: 20),

          // ✅ 조문조회, 1대1 문의
          MyPageOrderInquiry(orderCount: model.userMyPage.orderCount),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        SizedBox(
          width: 65,
          height: 65,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.5),
            child: CachedNetworkImage(
              imageUrl: '$baseURL${model.userMyPage.photoPath}',
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.userMyPage.nickName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
