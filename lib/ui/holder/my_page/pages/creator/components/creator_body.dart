import 'package:flutter/cupertino.dart';

import 'creator_bottom.dart';
import 'creator_top.dart';

class CreatorBody extends StatelessWidget {
  const CreatorBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            //프로필 설정 버튼까지
            child: CreatorTop(),
          ),
        ];
      },
      body: CreatorBottom(),
    );
  }
}
