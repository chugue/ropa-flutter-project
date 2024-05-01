import 'package:final_project_team02/models/popular_outfit.dart';
import 'package:flutter/material.dart';

class CodiLike extends StatelessWidget {
  const CodiLike({
    super.key,
    required this.ootd,
  });

  final Ootd ootd;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SizedBox(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    // TODO : 좋아요 기능넣기
                  },
                  icon: ootd.meLike == true /* 아이콘 인데, true면 ? false면 : */
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_outline)),
              Text("${ootd.like}"),
            ],
          ),
        ),
      ),
    );
  }
}
