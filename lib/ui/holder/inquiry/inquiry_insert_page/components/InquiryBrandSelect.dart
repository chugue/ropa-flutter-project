import 'package:final_project_team02/models/brand.dart';
import 'package:flutter/material.dart';

class InquiryBrandSelect extends StatelessWidget {
  const InquiryBrandSelect({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
      ],
    );
  }
}
