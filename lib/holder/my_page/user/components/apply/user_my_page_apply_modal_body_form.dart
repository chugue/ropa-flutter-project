import 'package:final_project_team02/holder/my_page/user/components/apply/user_my_page_apply_modal_body_form_apply_button.dart';
import 'package:final_project_team02/holder/my_page/user/components/apply/user_my_page_apply_modal_body_form_job_drop_box.dart';
import 'package:final_project_team02/holder/my_page/user/components/apply/user_my_page_apply_modal_body_form_text_field.dart';
import 'package:final_project_team02/holder/my_page/user/components/apply/user_my_page_apply_modal_body_form_title.dart';
import 'package:flutter/material.dart';

class UserMyPageApplyModalBodyForm extends StatelessWidget {
  const UserMyPageApplyModalBodyForm({
    required this.height,
    required this.weight,
    required this.job,
  });

  final TextEditingController height;
  final TextEditingController weight;
  final TextEditingController job;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              margin: buildEdgeInsets(), // 모달 좌우하단 여백 크기
              decoration: const BoxDecoration(
                  color: Colors.grey, // 모달 배경색
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserMyPageApplyModalFormTitle(),
                          Divider(),
                          SizedBox(height: 20),
                          UserMyPageApplyModalBodyFormTextField(
                            title: "키 ",
                            hinText: "키를 ",
                            controller: height,
                            physical: "cm",
                          ),
                          SizedBox(height: 20),
                          UserMyPageApplyModalBodyFormTextField(
                            title: "체중 ",
                            hinText: "체중을 ",
                            controller: weight,
                            physical: "kg",
                          ),
                          SizedBox(height: 20),
                          UserMyPageApplyModalBodyFormTextField(
                            title: "링크 ",
                            hinText: "링크를 ",
                            controller: job,
                            physical: "",
                          ),
                          SizedBox(height: 20),
                          UserMyPageApplyModalBodyJopDropBox(
                              title: "직업 ", list: ["작장인", "대학생"]),
                          SizedBox(height: 40),
                          UserMyPageApplyModalBodyApplyButton(),
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

          /// 바텀시트가 아닌 부분을 클릭했을 때 닫기
          isDismissible: true,

          /// 사이즈 조절
          constraints: const BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: 550,
          ),

          isScrollControlled: true,

          /// 바텀시트 배경 컬러
          backgroundColor: Colors.transparent,
          useSafeArea: true,
        );
      },
      child: Text(
        "지원하기",
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }

  EdgeInsets buildEdgeInsets() {
    return const EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 60,
            );
  }
}
