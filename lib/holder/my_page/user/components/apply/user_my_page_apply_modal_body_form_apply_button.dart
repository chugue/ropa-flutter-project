import 'package:final_project_team02/holder/main/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  UserMyPageApplyModalBodyApplyButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                //Dialog Main Title
                title: Text("크리에이터 지원에 감사합니다. 지원 결과는 1~2 영업일 소요됩니다.",style: TextStyle(fontSize: 15),),
                actions: [
                  TextButton(
                    onPressed: (){ Navigator.push
                      (context, MaterialPageRoute(builder: (context) => HomePage())); },
                    child: Text("확인"),
                  )
                ],

              );
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,),]
          ),
          child: Text(
            "지원하기",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
