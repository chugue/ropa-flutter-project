import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditInfo extends ConsumerWidget {
  final String fieldName;
  final String fieldValue;
  final Function(String fieldName, String value) onChanged;

  const EditInfo({
    required this.fieldName,
    required this.fieldValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController controller = TextEditingController(text: fieldValue);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: TextStyle(color: Colors.black54, fontSize: 13),
          ),
          TextField(
            onChanged: (value) => onChanged(fieldName, value),
            controller: controller,
            decoration: InputDecoration(
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
