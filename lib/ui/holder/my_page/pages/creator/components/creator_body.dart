import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_bottom.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_top.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatorBody extends ConsumerWidget {
  final sessionId;

  const CreatorBody({super.key, this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CreatorModel? model = ref.watch(creatorProvider(1));
    print("크리에이터 바디");
    print(model!.codiList[1].photoName);
    print(model);
    // TODO 모델이 Null이 들어옴.
    if (model == null) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Colors.blue,
        ),
      );
    } else {
      return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              //프로필 설정 버튼까지
              child: CreatorTop(model: model),
            ),
          ];
        },
        body: CreatorBottom(),
      );
    }
  }
}
