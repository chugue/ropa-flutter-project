import 'package:final_project_team02/ui/components/main_app_bar.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_content.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_create_at.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_item_list.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_like.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_list.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_main_scroll.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiBody extends ConsumerWidget {
  final int codiId;

  const CodiBody({
    required this.codiId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch  (상태 관리)
    CodiDetailModel? model = ref.watch(codiDetailProvider(codiId));

    return CustomScrollView(
      slivers: [
        MainAppBar(),
        SliverToBoxAdapter(
          child: CodiMainScroll(model: model),
        ),
        CodiLike(),
        CodiCreatedAt(),
        CodiContent(
          model: model,
        ),
        CodiTitle(title: "아이템 목록"),
        ItemList(),
        CodiTitle(title: "코디 목록"),
        CodiList(),
      ],
    );
  }
}
