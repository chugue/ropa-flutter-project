import 'package:final_project_team02/holder/my_page/user/components/user_my_page_body_bottom.dart';
import 'package:final_project_team02/holder/my_page/user/components/user_my_page_body_header.dart';
import 'package:flutter/material.dart';

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
            child: UserMyPageBodyTop(),
          ),
        ];
      },
      body: UserMyPageBodyBottom(),
    );
  }
}
