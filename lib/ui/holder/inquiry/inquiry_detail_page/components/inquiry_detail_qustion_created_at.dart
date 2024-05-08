import 'package:final_project_team02/data/global_data/inquiry.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class InquiryDetailQustionCreatedAt extends StatelessWidget {
  const InquiryDetailQustionCreatedAt({
    super.key,
    required this.inquiry,
  });

  final InquiryItem inquiry;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat("yyyy-MM-dd HH:mm").format(inquiry.createdAt),
      style: TextStyle(fontSize: 14.0),
    );
  }
}
