import 'package:final_project_team02/components/main_app_bar.dart';
import 'package:final_project_team02/holder/codi/components/codi_content.dart';
import 'package:final_project_team02/holder/codi/components/codi_create_at.dart';
import 'package:final_project_team02/holder/codi/components/codi_item_list.dart';
import 'package:final_project_team02/holder/codi/components/codi_like.dart';
import 'package:final_project_team02/holder/codi/components/codi_list.dart';
import 'package:final_project_team02/holder/codi/components/codi_main_scroll.dart';
import 'package:final_project_team02/holder/codi/components/codi_title.dart';
import 'package:final_project_team02/models/popular_outfit.dart';
import 'package:flutter/cupertino.dart';

class CodiBody extends StatelessWidget {
  const CodiBody({
    super.key,
    required this.ootd,
  });

  final Ootd ootd;

  @override
  Widget build(BuildContext context) {
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
