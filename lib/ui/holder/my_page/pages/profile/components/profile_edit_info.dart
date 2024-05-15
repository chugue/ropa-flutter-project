import 'package:flutter/material.dart';

class EditInfo extends StatelessWidget {
  final String fieldName;
  final String fieldValue;

  const EditInfo({
    required this.fieldName,
    required this.fieldValue,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: fieldValue);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${fieldName}",
            style: TextStyle(color: Colors.black54, fontSize: 13),
          ),
          TextField(
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
