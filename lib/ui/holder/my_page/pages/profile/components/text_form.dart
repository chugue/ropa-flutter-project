import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String text;

  const TextForm({
    required this.text,
  });

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${text}",
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),
            TextField(
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
