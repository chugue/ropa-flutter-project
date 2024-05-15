import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("로그아웃"),
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(sessionProvider).logout();
                    },
                    icon: const Icon(
                      CupertinoIcons.chevron_right,
                      color: Colors.black,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(
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
