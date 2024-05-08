import 'package:final_project_team02/data/global_data/inquiry.dart';
import 'package:flutter/material.dart';

class InquiryDetailQustionTitle extends StatelessWidget {
  const InquiryDetailQustionTitle({
    super.key,
    required this.inquiry,
  });

  final InquiryItem inquiry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.quora,
          size: 30,
        ),
        Text(
          " " + inquiry.title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
