import 'package:final_project_team02/data/domain_data/inquiry.dart';
import 'package:flutter/cupertino.dart';

class InquiryContent extends StatelessWidget {
  const InquiryContent({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "내용 : ",
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          inquiryList[index].content.length > 20
              ? inquiryList[index].content.substring(0, 20) + "...(더보기)"
              : inquiryList[index].content,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}
