import 'package:final_project_team02/ui/holder/my_page/pages/user/components/user_my_page_body_header.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/user_my_pageviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_my_page_body_bottom.dart';

class UserMyPageBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserMyPageModel? model = ref.watch(userMyPageProvider);

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
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
}
