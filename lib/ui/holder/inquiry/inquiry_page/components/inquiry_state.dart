import 'package:final_project_team02/models/inquiry.dart';
import 'package:flutter/material.dart';

class InquiryState extends StatelessWidget {
  const InquiryState({
    super.key,
    required this.formattedDate,
    required this.index,
  });

  final String formattedDate;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          inquiryList[index].state,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: inquiryList[index].state == "답변 완료"
                ? Colors.blue
                : Colors.black,
          ),
        ),
        Text(
          formattedDate,
          style: TextStyle(fontSize: 12.0),
        )
      ],
    );
  }
}
