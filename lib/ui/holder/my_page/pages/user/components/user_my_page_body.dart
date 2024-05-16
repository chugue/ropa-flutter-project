import 'package:final_project_team02/ui/holder/my_page/pages/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_my_page_body_bottom.dart';
import 'user_my_page_body_header.dart';

class UserMyPageBody extends ConsumerWidget {
  final sessionUserId;

  const UserMyPageBody({super.key, this.sessionUserId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserMyPageModel? model = ref.watch(userMyPageProvider(sessionUserId));
    print("😀😀😀😀😀😀😀😀😀😀😀");
    print(model);

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: UserMyPageBodyTop(model: model),
          ),
        ];
      },
      body: UserMyPageBodyBottom(),
    );
  }
}
