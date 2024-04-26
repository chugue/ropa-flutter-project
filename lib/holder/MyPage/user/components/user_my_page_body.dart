import 'package:final_project_team02/holder/MyPage/user/components/user_my_page_bottom.dart';
import 'package:final_project_team02/holder/MyPage/user/components/user_my_page_order_mileage.dart';
import 'package:flutter/material.dart';

import '../../../../components/custom_button.dart';
import '../../../../theme.dart';
import '../../creator/components/creator_my_page_header.dart';

class UserMyPageBody extends StatelessWidget {
  const UserMyPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            //프로필 설정 버튼까지
            child: MyPageheader(),
          ),
        ];
      },
      body: UserMyPageBottom(),
    );
  }
}
