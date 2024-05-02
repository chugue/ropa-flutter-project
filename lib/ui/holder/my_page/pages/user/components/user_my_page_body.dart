import 'package:flutter/material.dart';

import 'user_my_page_body_bottom.dart';
import 'user_my_page_body_header.dart';

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
