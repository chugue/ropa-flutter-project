import 'package:final_project_team02/data/domain_data/inquiry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'inquiry_detail_answer_content.dart';
import 'inquiry_detail_answer_state.dart';

class InquiryDetailAnswer extends StatelessWidget {
  const InquiryDetailAnswer({
    super.key,
    required this.inquiry,
  });

  final InquiryItem inquiry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: inquiry.state == "답변 완료" ? Colors.blue[100] : Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InquiryDetailAnswerState(inquiry: inquiry),
          SizedBox(height: 10),
          InquiryDetailAnswerContent(inquiry: inquiry),
          SizedBox(height: 10),
          if (inquiry.state == "답변 완료")
            Text(
              DateFormat("yyyy-MM-dd HH:mm").format(inquiry.answerCreatedAt),
              style: TextStyle(fontSize: 14.0),
            ),
        ],
      ),
    );
  }
}
