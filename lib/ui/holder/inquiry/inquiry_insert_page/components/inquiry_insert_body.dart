import 'package:final_project_team02/models/brand.dart';
import 'package:final_project_team02/ui/components/screen_size.dart';
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
          Text(
            "문의할 브랜드 선택*",
            style: TextStyle(color: Colors.black),
          ),
          DropdownMenu<String>(
            width: screenWidth * 0.93,
            initialSelection: "브랜드를 선택해주세요!",
            onSelected: (String? value) {},
            dropdownMenuEntries: [
              DropdownMenuEntry<String>(
                value: "브랜드를 선택해주세요!",
                label: "브랜드를 선택해주세요!",
              ),
              ...brands.map<DropdownMenuEntry<String>>((Brand brand) {
                return DropdownMenuEntry<String>(
                  value: brand.name,
                  label: brand.name,
                );
              }).toList(),
            ],
          ),
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
