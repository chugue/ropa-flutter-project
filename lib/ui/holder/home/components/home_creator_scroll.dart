import 'package:final_project_team02/data/global_data/creator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_creator_circle.dart';

class CreatorScroll extends StatelessWidget {
  const CreatorScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: creatorList.length,
          itemBuilder: (context, index) {
            /* 콜백 함수, 각 index에 자식 위젯 빌드 */ {
              return CreatorCircle(
                creator: creatorList[index],
              );
            }
          },
        ),
      ),
    );
  }
}
