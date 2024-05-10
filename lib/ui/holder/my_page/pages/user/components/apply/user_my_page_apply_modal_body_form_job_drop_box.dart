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
    return Row(
      children: [
        Text(
          "${title}: ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        DropdownMenu<String>(
          initialSelection: null,
          onSelected: (String? value) {},
          dropdownMenuEntries: [
            DropdownMenuEntry<String>(
              value: 'value',
              label: 'value', // 힌트 텍스트
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
