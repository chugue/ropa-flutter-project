import 'package:flutter/material.dart';

class UserMyPageApplyModalBodyJopDropBox extends StatelessWidget {
  final List<String> list;
  final String title;

  UserMyPageApplyModalBodyJopDropBox({
    required this.list,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    void handleDropdownChange(String? selectedValue) {
      // 선택된 값을 처리하는 로직
      print("Selected Value: $selectedValue");
    }

    return Row(
      children: [
        Text(
          "${title}: ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        DropdownMenu<String>(
          initialSelection: null,
          onSelected: handleDropdownChange,
          dropdownMenuEntries: [
            DropdownMenuEntry<String>(
              value: "직장인",
              label: "", // 힌트 텍스트
            ),
            ...list.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(
                value: value,
                label: value,
              );
            }).toList(),
          ],
        ),
      ],
    );
  }
}
