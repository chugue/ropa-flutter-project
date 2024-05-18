import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/ui/components/login_is_check.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../_core/constants/http.dart';
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
    SessionData session = ref.watch(sessionProvider);

    if (model == null) return Align(child: const CircularProgressIndicator());
    if (session.user?.id == null) return Align(child: LoginIsCheck());

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            //프로필 설정 버튼까지
            child: CreatorViewTop(model: model),
          ),
        ];
      },
      body: CreatorViewBottom(model: model),
    );
  }
}
