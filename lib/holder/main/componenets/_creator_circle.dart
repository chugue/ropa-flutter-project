import 'package:final_project_team02/models/creator.dart';
import 'package:flutter/cupertino.dart';

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
        child: Container /* 각 index에 높이 50, 색상 파란색 Container 반환 */ (
          width: 70,
          child: Image.asset(
            creator.adImg,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
