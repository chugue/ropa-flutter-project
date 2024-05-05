import 'package:final_project_team02/data/domain_data/inquiry.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_detail_page/components/inquiry_detail_body.dart';
import 'package:flutter/material.dart';

class InquiryDetailPage extends StatelessWidget {
  final InquiryItem inquiry;

  const InquiryDetailPage({Key? key, required this.inquiry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1:1 문의 내용"),
      ),
      body: InquiryDetailPageBody(inquiry: inquiry),
    );
  }
}
