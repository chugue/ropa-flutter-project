import 'package:final_project_team02/ui/holder/inquiry/inquiry_insert_page/components/inquiry_insert_button.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_insert_page/components/inquiry_inset_content.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_insert_page/components/inquiry_inset_title.dart';
import 'package:flutter/cupertino.dart';

class InquiryInsertBody extends StatelessWidget {
  const InquiryInsertBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InquiryInsertTitle(),
          SizedBox(height: 16),
          InquiryInsertContent(),
          SizedBox(height: 16),
          InquiryInsertButton(),
        ],
      ),
    );
  }
}
