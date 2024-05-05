import 'package:final_project_team02/data/domain_data/inquiry.dart';
import 'package:flutter/material.dart';

class InquiryCode extends StatelessWidget {
  const InquiryCode({
    super.key,
    required this.inquiry,
  });

  final InquiryItem inquiry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "NO. " + inquiry.inquiryCode,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
