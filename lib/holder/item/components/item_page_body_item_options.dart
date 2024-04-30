import 'package:flutter/material.dart';

class ItemOptions extends StatelessWidget {
  const ItemOptions({
    required this.optionList,
    required this.optionName,
  });

  final List<String> optionList;
  final String optionName;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.85;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: DropdownMenu<String>(
        width: screenWidth,
        initialSelection: "${optionName}" /* 📢초기 선택 값 */,
        onSelected: (String? value) {} /* 📢콜백 함수 */,
        dropdownMenuEntries: [
          DropdownMenuEntry<String>(
            value: "${optionName}",
            label: "${optionName}",
          ),
          ...optionList.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(
              value: value,
              label: value,
            );
          }).toList(),
          // 📢 리스트의 각 항목을 DropdownMenuEntry<String>로 변환. 목록에 추가
        ],
      ),
    );
  }
}
