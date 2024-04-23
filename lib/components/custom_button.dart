import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme.dart';

class custom_button extends StatelessWidget {
  const custom_button({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 400,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
        ),
        child: Align(
          child: Text(
            '${title}', // :TODO 04수정 (오타)
            style: textTheme().titleMedium, // :TODO 04수정
          ),
        ),
      ),
    );
  }
}
