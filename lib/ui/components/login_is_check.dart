import 'package:final_project_team02/_core/constants/move.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginIsCheck extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      content: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 20, color: Colors.black, height: 2),
          children: <TextSpan>[
            TextSpan(
              text: '로그인',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: '이 필요한 서비스입니다.\n'),
            TextSpan(text: '이동 하시겠습니까?'),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Move.loginPage);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  '로그인',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10), // 버튼 사이에 간격을 줍니다.
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Move.mainHolder, (_) => false);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  '취소',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
