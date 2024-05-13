import 'package:flutter/material.dart';

class BuyAddressTabBarViewInputTextForm extends StatelessWidget {
  final String text;
  final controller;
  final onChanged;

  const BuyAddressTabBarViewInputTextForm({
    required this.text,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        textAlign: TextAlign.start,
        maxLines: 1,
        decoration: InputDecoration(
          label: Text("${text}"),
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
