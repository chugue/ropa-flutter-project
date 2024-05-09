import 'package:final_project_team02/data/domain_data/inquiry.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/components/inquiry_brand.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/components/inquiry_code.dart';
import 'package:final_project_team02/data/global_data/inquiry.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/components/inquiry_detail_answer.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/components/inquiry_detail_qestion.dart';
import 'package:flutter/material.dart';

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
          InquiryBrand(inquiry: inquiry),
          InquiryCode(inquiry: inquiry),
          InquiryDetailQuestion(inquiry: inquiry),
          SizedBox(height: 10),
          InquiryDetailAnswer(inquiry: inquiry),
        ],
      ),
    );
  }
}
