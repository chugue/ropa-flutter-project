import 'package:final_project_team02/data/domain_data/inquiry.dart';
import 'package:flutter/cupertino.dart';

class InquiryTitle extends StatelessWidget {
  const InquiryTitle({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "제목 : ",
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          inquiryList[index].title,
        ),
      ],
    );
  }
}
