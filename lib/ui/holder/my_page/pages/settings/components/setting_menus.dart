import 'package:final_project_team02/ui/holder/my_page/pages/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingMenus extends StatelessWidget {
  final String field;
  final String value;
  final bool isEdit;

  const SettingMenus({
    required this.field,
    required this.value,
    required this.isEdit,
  });

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
                  if (isEdit == true)
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfileSetting(),
                        ));
                      },
                      icon: Icon(
                        CupertinoIcons.chevron_right,
                        color: Colors.black,
                        size: 16,
                      ),
                    )
                  else
                    SizedBox(width: 48, height: 16)
                  // SizedBox를 너비와 높이를 지정하여 공간을 차지하도록 함
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
