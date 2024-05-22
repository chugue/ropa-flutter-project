import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/ui/components/login_is_check.dart';
import 'package:final_project_team02/ui/components/main_app_bar.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_content.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_create_at.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_item_list.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_like.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_list.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'codi_main_scroll.dart';

class CodiBody extends ConsumerWidget {
  final int codiId;

  const CodiBody({
    required this.codiId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(buyProvider.notifier).selectedCodiId(codiId);
    // watch  (상태 관리)
    CodiDetailModel? model = ref.watch(codiDetailProvider(codiId));
    SessionData session = ref.watch(sessionProvider);

    print(model);

    if (model == null) return Align(child: const CircularProgressIndicator());
    if (session.user?.id == null) return Align(child: LoginIsCheck());

    return CustomScrollView(
      slivers: [
        MainAppBar(),
        SliverToBoxAdapter(child: CodiMainScroll(model: model)),
        SliverToBoxAdapter(
          child: Consumer(
            builder: (context, ref, _) {
              CodiDetailModel? likeModel =
                  ref.watch(codiDetailProvider(codiId));
              return CodiLike(model: likeModel!, codiId: codiId);
            },
          ),
        ),
        SliverToBoxAdapter(child: CodiCreatedAt()),
        SliverToBoxAdapter(child: CodiContent(model: model)),
        CodiTitle(title: "아이템 목록"),
        SliverToBoxAdapter(
            child: ItemList(
          model: model,
          codiId: codiId,
        )),
        CodiTitle(title: "코디 목록"),
        CodiList(model: model),
      ],
    );
  }
}
