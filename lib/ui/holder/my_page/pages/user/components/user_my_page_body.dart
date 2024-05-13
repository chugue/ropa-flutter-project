import 'package:final_project_team02/ui/holder/my_page/pages/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_my_page_body_bottom.dart';
import 'user_my_page_body_header.dart';

class UserMyPageBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserMyPageModel? model = ref.watch(UserMyPageProvider(2));
    print("😀😀😀😀😀😀😀😀😀😀😀");
    print(model);

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            //프로필 설정 버튼까지
            child: UserMyPageBodyTop("회원나이"),
          ),
        ];
      },
      body: UserMyPageBodyBottom(),
    );
  }
}
