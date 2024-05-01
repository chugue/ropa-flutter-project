import 'package:final_project_team02/ui/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/creator_view_page_body.dart';
import 'components/creator_view_page_header.dart';

class CreatorPage extends StatelessWidget {
  const CreatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(home: Icons.home, cart: null, setting: Icons.settings),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              //프로필 설정 버튼까지
              child: CreatorViewPageheader(),
            ),
          ];
        },
        body: CreatorViewPageBottom(),
      ),
    );
  }
}
