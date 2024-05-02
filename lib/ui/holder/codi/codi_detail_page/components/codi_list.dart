import 'package:final_project_team02/data/domain_data/popular_outfit.dart';
import 'package:flutter/cupertino.dart';

class CodiList extends StatelessWidget {
  const CodiList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // ✅한 행에 두 개의 항목
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 8.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Image.asset(
            ootdList[index].Img,
            fit: BoxFit.cover,
          );
        },
        childCount: ootdList.length + 5,
      ),
    );
  }
}
