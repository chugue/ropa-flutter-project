import 'package:final_project_team02/data/domain_data/ootd.dart';
import 'package:final_project_team02/ui/components/main_app_bar.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_content.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_create_at.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_item_list.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_like.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_list.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_main_scroll.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_title.dart';
import 'package:flutter/cupertino.dart';

class CodiBody extends StatelessWidget {
  final Ootd ootd;

  CodiBody({required this.ootd});

  @override
  Widget build(BuildContext context) {
    // watch  (상태 관리)

    return CustomScrollView(
      slivers: [
        MainAppBar(),
        CodiMainScroll(),
        CodiLike(ootd: ootd),
        CodiCreatedAt(),
        CodiContent(),
        CodiTitle(title: "아이템 목록"),
        ItemList(),
        CodiTitle(title: "코디 목록"),
        CodiList(),
      ],
    );
  }
}
