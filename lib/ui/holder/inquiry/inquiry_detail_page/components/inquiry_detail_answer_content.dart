import 'package:final_project_team02/data/global_data/inquiry.dart';
import 'package:flutter/material.dart';

class InquiryDetailAnswerContent extends StatelessWidget {
  const InquiryDetailAnswerContent({
    super.key,
    required this.inquiry,
  });

  final InquiryItem inquiry;

  @override
  Widget build(BuildContext context) {
    return Text(
      inquiry.answer,
      style: TextStyle(fontSize: 16.0, color: Colors.black),
    );
  }
}
