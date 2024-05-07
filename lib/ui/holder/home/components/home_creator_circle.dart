import 'package:final_project_team02/data/global_data/creator.dart';
import 'package:flutter/material.dart';

import '../../my_page/pages/creator_view/creator_view_page.dart';

class CreatorCircle extends StatelessWidget {
  const CreatorCircle({
    super.key,
    required this.creator,
  });

  final Creator creator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreatorViewPage()));
          },
          child: Container /* 각 index에 높이 50, 색상 파란색 Container 반환 */ (
            width: 70,
            child: Image.asset(
              creator.adImg,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
