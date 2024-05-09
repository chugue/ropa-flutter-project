import 'package:flutter/material.dart';

class EditInfo extends StatelessWidget {
  final String text;
  final String userInfo;

  const EditInfo({
    required this.text,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: userInfo);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${text}",
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
