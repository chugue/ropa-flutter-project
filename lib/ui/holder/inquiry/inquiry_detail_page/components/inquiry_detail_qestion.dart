import 'package:final_project_team02/data/global_data/inquiry.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/components/Inquiry_detail_qustion_title.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/components/inquiry_detail_qustion_content.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/components/inquiry_detail_qustion_created_at.dart';
import 'package:flutter/material.dart';

class InquiryDetailQuestion extends StatelessWidget {
  const InquiryDetailQuestion({
    super.key,
    required this.inquiry,
  });

  final InquiryItem inquiry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _qIcon(),
          InquiryDetailQuestionTitle(inquiry: inquiry),
          SizedBox(height: 10),
          InquiryDetailQustionContent(inquiry: inquiry),
          SizedBox(height: 10),
          InquiryDetailQustionCreatedAt(inquiry: inquiry),
        ],
      ),
    );
  }

  Row _qIcon() {
    return Row(
      children: [
        Icon(
          Icons.quora,
          size: 36.0,
        ),
        Text(
          ".",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
