import 'package:final_project_team02/ui/components/screen_size.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_insert_page/components/InquiryBrandSelect.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_insert_page/components/inquiry_insert_button.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_insert_page/components/inquiry_inset_content.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_insert_page/components/inquiry_inset_title.dart';
import 'package:flutter/material.dart';

class InquiryInsertBody extends StatelessWidget {
  const InquiryInsertBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenSize.getScreenWidth(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InquiryBrandSelect(screenWidth: screenWidth),
          SizedBox(height: 16),
          InquiryInsertTitle(),
          SizedBox(height: 16),
          InquiryInsertContent(),
          SizedBox(height: 16),
          SizedBox(height: 16),
          InquiryInsertButton(),
        ],
      ),
    );
  }
}
