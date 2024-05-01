import 'package:final_project_team02/ui/components/custom_app_bar.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_my_page_header.dart';
import 'package:flutter/material.dart';

import 'components/creator_my_page_bottom.dart';

class CreatorMyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        home: Icons.home,
        setting: Icons.settings,
        cart: null,
      ),
      backgroundColor: Colors.white,
      body: creator_my_body(),
    );
  }
}

class creator_my_body extends StatelessWidget {
  const creator_my_body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            //프로필 설정 버튼까지
            child: CreatorMyPageheader(),
          ),
        ];
      },
      body: CreatorMyPageBottom(),
    );
  }
}
