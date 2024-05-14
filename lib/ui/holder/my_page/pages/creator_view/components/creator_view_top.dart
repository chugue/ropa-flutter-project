import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreatorViewTop extends StatelessWidget {
  final CreatorModel model;

  CreatorViewTop({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 30),
          _buildCreatorPic(),
          SizedBox(height: 20),
          _buildCreatorComment(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCreatorPic() {
    return Row(
      children: [
        SizedBox(
          width: 65,
          height: 65,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.5),
            child: Image.network(
              'https://picsum.photos/200/100', // :TODO 04 사진수정
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.user.nickName,
                style: textTheme().displayMedium), // :TODO 04수정
            Text("${model.user} • ${model.user.height} • ${model.user.job}",
                // "185cm - 80kg - 직장인",
                style: textTheme().bodyMedium), // :TODO 04수정
          ],
        ),
      ],
    );
  }

  Widget _buildCreatorComment() {
    return Row(
      children: [
        Column(
          children: [
            Text('어깨 넓은 보통 체형', style: textTheme().headlineSmall),
            Text('어깨 넓은 보통 체형', style: textTheme().headlineSmall),
            Text('어깨 넓은 보통 체형', style: textTheme().headlineSmall),
          ],
        ),
      ],
    );
  }
}
