import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'creator_view_bottom.dart';
import 'creator_view_top.dart';

class CreatorViewBody extends ConsumerWidget {
  final int creatorId;

  CreatorViewBody({
    required this.creatorId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CreatorModel? model = ref.watch(creatorProvider(creatorId));
    print("승호");

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              //프로필 설정 버튼까지
              child: CreatorViewTop(model: model),
            ),
          ];
        },
        body: CreatorViewBottom(),
      );
    }
  }
}
