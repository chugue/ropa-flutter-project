import 'package:final_project_team02/data/global_data/inquiry.dart';
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
      inquiry.content,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
      ),
    );
  }
}
