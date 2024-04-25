import 'package:final_project_team02/models/popular_outfit.dart';
import 'package:flutter/material.dart';

class PopularOotd extends StatelessWidget {
  const PopularOotd({
    super.key,
    required this.ootd,
  });

  final Ootd ootd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(
              ootd.Img,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
        ],
      ),
    );
  }
}
