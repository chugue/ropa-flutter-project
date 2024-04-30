import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String text;

  const TextForm({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      child: TextFormField(
        textAlign: TextAlign.start,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: text,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black26,
            ),
          ),
        ),
      ),
    );
  }
}
