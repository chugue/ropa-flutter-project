import 'package:flutter/cupertino.dart';
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
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        DropdownMenu<String>(
          initialSelection: list.first,
          onSelected: (String? value) {

          },
          dropdownMenuEntries: list
              .map<DropdownMenuEntry<String>>(
                  (String value) {
                return DropdownMenuEntry<String>(
                    value: value, label: value);
              }).toList(),
        ),
      ],
    );
  }


}

