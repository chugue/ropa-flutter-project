import 'package:final_project_team02/components/custom_form_field.dart';
import 'package:final_project_team02/holder/MyPage/user/components/user_my_page_apply_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../_core/uitls/validator_util.dart';

class UserMyPageApplyButton extends StatelessWidget {
  final weight = TextEditingController();
  final height = TextEditingController();
  final job = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 66,
        left: 10,
        right: 10,
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 600, // 모달 높이 크기
                    margin: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 40,
                    ), // 모달 좌우하단 여백 크기
                    decoration: const BoxDecoration(
                      color: Colors.grey, // 모달 배경색
                      borderRadius: BorderRadius.all(
                        Radius.circular(20), // 모달 전체 라운딩 처리
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20), //
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20), //
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("크리에이터 지원하기",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "키: ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      child: UserMyPageApplyFormField(
                                        hintext: "키",
                                        controller: weight,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return '값을 입력해주세요';
                                          }
                                          final number = double.tryParse(value);
                                          if (number == null) {
                                            return '숫자만 입력해주세요';
                                          }
                                          // 여기서 추가적인 유효성 검사를 할 수 있습니다. 예: 범위 검사
                                          return null; // 입력 값이 유효할 경우 null을 반환
                                        },
                                      ),
                                    ),
                                    Text(
                                      "cm",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "체중: ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      child: UserMyPageApplyFormField(
                                          hintext: "체중",
                                          controller: height,
                                          validator: null),
                                    ),
                                    Text(
                                      "kg",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },

                /// 바텀시트 드래그 가능 여부
                enableDrag: true,

                /// 바텀시트 배경 컬러
                backgroundColor: Colors.transparent,
                useSafeArea: true,
              );
            },
            child: Text(
              "지원하기",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ));
  }
}
