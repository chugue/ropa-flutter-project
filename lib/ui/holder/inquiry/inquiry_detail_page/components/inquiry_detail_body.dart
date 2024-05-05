import 'package:final_project_team02/models/inquiry.dart';
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
          Row(
            children: [
              SizedBox(
                width: 60.0,
                height: 60.0,
                child: Image.network(inquiry.brand.logo),
              ),
              SizedBox(width: 10),
              Text(
                inquiry.brand.name,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          InquiryDetailQuestion(inquiry: inquiry),
          SizedBox(height: 10),
          InquiryDetailAnswer(inquiry: inquiry),
        ],
      ),
    );
  }
}
