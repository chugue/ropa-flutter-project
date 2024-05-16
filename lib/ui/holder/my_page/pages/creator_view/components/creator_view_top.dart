import 'dart:convert';

import 'package:final_project_team02/_core/constants/theme.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:flutter/material.dart';

class CreatorViewTop extends StatelessWidget {
  final CreatorModel model;

  CreatorViewTop({required this.model});

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
            child: Image.memory(
              base64Decode(model.user.base64),
              // Image.network(
              // 'https://picsum.photos/200/100', // :TODO 04 사진수정
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(model.user.nickName,
                    // "Kenneth",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Icon(
                  Icons.verified,
                  color: Colors.blueAccent,
                ),
              ],
            ),
            Text(
                "${model.user.height} • ${model.user.weight} • ${model.user.job}",
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
            // Text('어깨 넓은 보통 체형', style: textTheme().headlineSmall),
            Text(
              model.user.introMsg,
              style: textTheme().headlineSmall,
            )
          ],
        ),
      ],
    );
  }
}
