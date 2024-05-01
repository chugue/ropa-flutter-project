import 'package:final_project_team02/models/popular_outfit.dart';
import 'package:flutter/material.dart';

import '../../components/main_app_bar.dart';
import 'componenets/_codi_content.dart';
import 'componenets/_codi_create_at.dart';
import 'componenets/_codi_item_list.dart';
import 'componenets/_codi_like.dart';
import 'componenets/_codi_list.dart';
import 'componenets/_codi_main_scroll.dart';
import 'componenets/_codi_title.dart';

class CodiPage extends StatelessWidget {
  const CodiPage({super.key, required this.ootd});

  final Ootd ootd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
      ),
    );
  }
}
