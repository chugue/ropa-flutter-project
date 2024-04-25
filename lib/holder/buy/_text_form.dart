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
        maxLines: 1,
        decoration: InputDecoration(
          hintText: text,
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
