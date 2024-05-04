import 'package:final_project_team02/models/inquiry.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/components/inquiry_detail_answer.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/components/inquiry_detail_qestion.dart';
import 'package:flutter/cupertino.dart';

class InquiryDetailPageBody extends StatelessWidget {
  const InquiryDetailPageBody({
    super.key,
    required this.inquiry,
  });

  final InquiryItem inquiry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InquiryDetailQuestion(inquiry: inquiry),
          SizedBox(height: 10),
          InquiryDetailAnswer(inquiry: inquiry),
        ],
      ),
    );
  }
}
