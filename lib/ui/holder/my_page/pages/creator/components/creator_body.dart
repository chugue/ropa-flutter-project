import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_bottom.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/components/creator_top.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatorBody extends ConsumerWidget {
  const CreatorBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserMyPageModel? model = ref.watch(UserMyPageProvider(1));
    print(model);

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
