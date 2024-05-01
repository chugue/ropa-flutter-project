import 'package:flutter/cupertino.dart';

import 'creator_view_bottom.dart';
import 'creator_view_top.dart';

class CreatorViewBody extends StatelessWidget {
  const CreatorViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            //프로필 설정 버튼까지
            child: CreatorViewTop(),
          ),
        ];
      },
      body: CreatorViewBottom(),
    );
  }
}
