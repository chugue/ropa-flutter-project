import 'package:final_project_team02/models/popular_outfit.dart';
import 'package:flutter/material.dart';

class CodiLike extends StatefulWidget {
  const CodiLike({
    super.key,
    required this.ootd,
  });

  final Ootd ootd;

  @override
  State<CodiLike> createState() => _CodiLikeState();
}

class _CodiLikeState extends State<CodiLike> {
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
                    setState(() {
                      widget.ootd.meLike = !widget.ootd.meLike;
                      if (widget.ootd.meLike) {
                        widget.ootd.like += 1; // 좋아요 추가
                      } else {
                        widget.ootd.like -= 1; // 좋아요 제거
                      }
                    });
                  },
                  icon:
                      widget.ootd.meLike == true /* 아이콘 인데, true면 ? false면 : */
                          ? Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_outline)),
              Text("${widget.ootd.like}"),
            ],
          ),
        ),
      ),
    );
  }
}
