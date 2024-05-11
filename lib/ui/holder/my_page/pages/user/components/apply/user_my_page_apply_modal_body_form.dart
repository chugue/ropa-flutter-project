import 'package:final_project_team02/_core/uitls/validator_util.dart';
import 'package:final_project_team02/data/dtos/user_req.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/components/apply/apply_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/components/apply/user_my_page_apply_modal_body_form_text_field.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/user/components/apply/user_my_page_apply_modal_body_form_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserMyPageApplyModalBodyForm extends ConsumerWidget {
  final TextEditingController _comment = TextEditingController();
  final TextEditingController _height;
  final TextEditingController _weight;
  final TextEditingController _instagram;
  final TextEditingController _job;
  final GlobalKey<FormState> _formKey;

  UserMyPageApplyModalBodyForm({
    required TextEditingController pHeight,
    required TextEditingController pWeight,
    required TextEditingController pInstagram,
    required TextEditingController pJob,
    required GlobalKey<FormState> formKey,
  })  : _height = pHeight,
        _weight = pWeight,
        _job = pJob,
        _instagram = pInstagram,
        _formKey = formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> list = ['직장인', '대학생'];
    ApplyModel? model = ref.watch(applyProvider);

    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          barrierColor: Colors.black54,
          isDismissible: true,
          context: context,
          builder: (BuildContext context) {
            final MediaQueryData mediaQueryData = MediaQuery.of(context);
            final double keyboardHeight = mediaQueryData.viewInsets.bottom;

            return AnimatedPadding(
              padding: EdgeInsets.only(bottom: keyboardHeight),
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: ListView(
                children: [
                  Container(
                    margin: buildEdgeInsets(),
                    // 모달 좌우하단 여백 크기
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  UserMyPageApplyModalFormTitle(),
                                  Divider(),
                                  SizedBox(height: 20),
                                  UserMyPageApplyModalBodyFormTextField(
                                    title: "키    ",
                                    hinText: "키를 ",
                                    controller: _height,
                                    physical: "cm",
                                    validator:
                                        validateApplyHeight(), // Attach the validator function
                                  ),
                                  SizedBox(height: 20),
                                  UserMyPageApplyModalBodyFormTextField(
                                    title: "체중 ",
                                    hinText: "체중을 ",
                                    controller: _weight,
                                    physical: "kg",
                                    validator:
                                        validateApplyWeight(), // Validator previously defined
                                  ),
                                  SizedBox(height: 20),
                                  UserMyPageApplyModalBodyFormTextField(
                                    title: "링크 ",
                                    hinText: "링크를 ",
                                    controller: _instagram,
                                    physical: "",
                                    validator:
                                        validateInstagramLink(), // Attach the validator function
                                  ),
                                  SizedBox(height: 20),
                                  UserMyPageApplyModalBodyFormTextField(
                                    title: "직업 ",
                                    hinText: "직업을 ",
                                    controller: _job,
                                    physical: "",
                                    validator:
                                        validateJob(), // Attach the validator function
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: _comment,
                                    minLines: 3,
                                    maxLines: 3,
                                    maxLength: 100,
                                    validator: validateContent(),
                                    decoration: InputDecoration(
                                      hintText: "여러분에 대해 짧게 소개해주세요!",
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 8.0),
                                      hintStyle: TextStyle(
                                          color:
                                              Colors.grey), // hintText의 위치 조절
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  InkWell(
                                    hoverColor: Colors.transparent,
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {
                                      bool isOk =
                                          _formKey.currentState!.validate();

                                      if (isOk) {
                                        String height = _height.text.trim();
                                        String weight = _weight.text.trim();
                                        String instagram =
                                            _instagram.text.trim();
                                        String comment = _comment.text.trim();
                                        String job = _job.text.trim();

                                        print(
                                            "999999999999999999999999999999999999 ${height}, ${weight}, ${comment},${job}");

                                        UserCreatorApplyReqDTO reqDTO =
                                            UserCreatorApplyReqDTO(
                                          comment: comment,
                                          weight: weight + 'kg',
                                          instagram: instagram,
                                          job: job,
                                          height: height + 'cm',
                                        );

                                        print(
                                            "00000000000000000000000000000000000${reqDTO.toJson()}00000000000000000000000000000000");
                                        SessionData s =
                                            ref.read(sessionProvider);
                                        s.UserCreatorApply(reqDTO);
                                      }
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                              ),
                                            ]),
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          isScrollControlled: true,
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
      bottom: 0,
    );
  }
}
