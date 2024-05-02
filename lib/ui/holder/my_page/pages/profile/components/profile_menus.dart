import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileMenus extends StatelessWidget {
  final String field;
  final String value;

  const ProfileMenus({required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(field),
            Container(
              child: Row(
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.black26,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.chevron_right,
                    color: Colors.black87,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
