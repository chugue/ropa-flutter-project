import 'package:final_project_team02/data/global_data/inquiry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InquiryTitle extends StatelessWidget {
  const InquiryTitle({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "제목 : ",
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            inquiryList[index].title,
          ),
        ),
      ],
    );
  }
}
