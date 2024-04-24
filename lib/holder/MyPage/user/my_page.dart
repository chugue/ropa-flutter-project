import 'package:flutter/material.dart';

import '../../../components/custom_app_bar.dart';
import 'components/_my_page_body.dart';
import 'components/_my_page_header.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

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
              child: MyPageheader(),
            ),
          ];
        },
        body: MyPageBody(),
      ),
    );
  }
}
