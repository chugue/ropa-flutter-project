import 'package:final_project_team02/models/inquiry.dart';
import 'package:flutter/material.dart';

class InquiryDetailQuestionTitle extends StatelessWidget {
  const InquiryDetailQuestionTitle({
    super.key,
    required this.inquiry,
  });

  final InquiryItem inquiry;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            "제목 : " + inquiry.title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
