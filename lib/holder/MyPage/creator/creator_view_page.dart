import 'package:flutter/material.dart';

import '../../../components/custom_app_bar.dart';
import 'components/_creator_page_body.dart';
import 'components/_creator_page_header.dart';

class CreatorPage extends StatelessWidget {
  const CreatorPage({super.key});

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
              child: CreatorPageheader(),
            ),
          ];
        },
        body: CreatorPageBody(),
      ),
    );
  }
}
