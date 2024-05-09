import 'package:flutter/material.dart';

class FixedInfo extends StatelessWidget {
  final String fieldName;
  final String fieldValue;

  const FixedInfo({
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
          SizedBox(height: 20),
          Text(
            fieldValue,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: 1.0,
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
