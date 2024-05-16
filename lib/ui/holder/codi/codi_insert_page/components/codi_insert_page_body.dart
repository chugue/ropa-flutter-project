import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_pic_insert_scroll.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_styling_comment.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_styling_title.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_sub_title.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_title.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_pic_item_insert_scroll.dart';
import 'package:flutter/material.dart';

class CodiInsetPageBody extends StatelessWidget {
  const CodiInsetPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CodiInsertTitle(),
            SizedBox(height: 20.0),

            CodiPicInsertScroll(),
            SizedBox(height: 50),

            CodiInsertSubTitle(subTitle: "착용 아이템"),

            CodiPicItemInsertScroll(),
            SizedBox(height: 50),

            CodiInsertSubTitle(subTitle: "제목"),
            StylingTitle(),
            SizedBox(height: 50),

            CodiInsertSubTitle(subTitle: "스타일링 코멘트"),
            StylingComment(),
          ],
        ),
      ),
    );
  }
}
