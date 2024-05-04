import 'package:final_project_team02/models/inquiry.dart';
import 'package:flutter/material.dart';

class InquiryDetailAnswerState extends StatelessWidget {
  const InquiryDetailAnswerState({
    super.key,
    required this.inquiry,
  });

  final InquiryItem inquiry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          inquiry.state,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            // 📢 답변완료일 경우 배경색 🟦
            color: inquiry.state == "답변 완료" ? Colors.blue : Colors.black,
          ),
        ),
      ],
    );
  }
}
