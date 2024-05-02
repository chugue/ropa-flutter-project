import 'package:final_project_team02/data/domain_data/popular_outfit.dart';
import 'package:final_project_team02/ui/components/main_app_bar.dart';
import 'package:flutter/cupertino.dart';

import 'codi_content.dart';
import 'codi_create_at.dart';
import 'codi_item_list.dart';
import 'codi_like.dart';
import 'codi_list.dart';
import 'codi_main_scroll.dart';
import 'codi_title.dart';

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
