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
    String?
        selectedValue; // This will need to be managed by a stateful widget or a state management approach if this widget is to be functional.

    return Row(
      children: [
        Text(
          "$title: ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          value: selectedValue,
          onChanged: (String? newValue) {
            // This should ideally be handled by setting state in a StatefulWidget or using another state management solution

            selectedValue = newValue;
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
