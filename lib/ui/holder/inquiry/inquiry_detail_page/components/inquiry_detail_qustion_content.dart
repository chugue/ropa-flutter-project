import 'package:final_project_team02/data/domain_data/inquiry.dart';
import 'package:flutter/material.dart';

class InquiryDetailQustionContent extends StatelessWidget {
  const InquiryDetailQustionContent({
    super.key,
    required this.inquiry,
  });

  final InquiryItem inquiry;

  @override
  Widget build(BuildContext context) {
    return Text(
      "내용 : " + inquiry.content,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
      ),
    );
  }
}
