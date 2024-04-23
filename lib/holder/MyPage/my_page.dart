import 'package:final_project_team02/holder/MyPage/my_page_body.dart';
import 'package:final_project_team02/holder/MyPage/my_page_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../components/custom_app_bar.dart';


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
              child: MyPageHeader(),
            ),
          ];
        },
        body: MyPageBody(),
      ),
    );
  }
}
