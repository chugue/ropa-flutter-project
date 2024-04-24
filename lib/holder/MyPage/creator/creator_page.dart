import 'package:final_project_team02/holder/MyPage/creator/_creator_page_body.dart';
import 'package:final_project_team02/holder/MyPage/creator/_creator_page_header.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_app_bar.dart';

class CreatorPage extends StatelessWidget {
  const CreatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(micon: Icons.home),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              //프로필 설정 버튼까지
              child: CreatorPageheader(),
            ),
          ];
        },
        body: CreatorPageBody(),
      ),
    );
  }
}
