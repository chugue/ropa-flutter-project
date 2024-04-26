import 'package:final_project_team02/holder/MyPage/creator/components/creator_my_page_header.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_app_bar.dart';
import '../user/components/user_my_page_bottom.dart';
import '../user/components/user_my_page_header.dart';
import 'components/creator_my_page_bottom.dart';

class CreatorMyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(miconRight: Icons.home, miconLeft: Icons.settings),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              //프로필 설정 버튼까지
              child: CreatorMyPageheader(),
            ),
          ];
        },
        body: CreatorMyPageBottom(),
      ),
    );
  }
}
