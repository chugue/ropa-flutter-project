import 'package:final_project_team02/ui/holder/inquiry/inquiry_insert_page/components/inquiry_insert_body.dart';
import 'package:flutter/material.dart';

class InquiryInsertPage extends StatelessWidget {
  const InquiryInsertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("문의 작성"),
      ),
      body: InquiryInsertBody(),
    );
  }
}
