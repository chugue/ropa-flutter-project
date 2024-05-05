import 'package:final_project_team02/data/domain_data/ootd.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_page.dart';
import 'package:flutter/material.dart';

class PopularOotd extends StatefulWidget {
  const PopularOotd({
    super.key,
    required this.ootd,
  });

  final Ootd ootd;

  @override
  State<PopularOotd> createState() {
    return _PopularOotdState();
  }
}

class _PopularOotdState extends State<PopularOotd> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print("사진 클릭 됨");
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CodiPage(
                          ootd: widget.ootd,
                        )),
              );
            },
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(
                widget.ootd.Img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                    icon: widget.ootd.meLike ==
                            true /* 아이콘 인데, true면 ? false면 : */
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_outline)),
                Text("${widget.ootd.like}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
