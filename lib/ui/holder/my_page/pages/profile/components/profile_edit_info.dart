import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditInfo extends ConsumerWidget {
  final String? fieldName;
  final String fieldValue;
  final Function(String fieldName, String value) onChanged;
  final controller;

  const EditInfo({
    this.fieldName,
    required this.controller,
    required this.fieldValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName!,
            style: TextStyle(color: Colors.black54, fontSize: 13),
          ),
          TextFormField(
            onChanged: (value) => onChanged(fieldName!, value),
            controller: controller,
            decoration: InputDecoration(
              label: Text('${fieldValue}'),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
