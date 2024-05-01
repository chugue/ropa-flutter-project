import 'package:final_project_team02/ui/holder/my_page/pages/user/components/apply/user_my_page_apply_modal_body_form.dart';
import 'package:flutter/material.dart';

class UserMyPageApplyModalBody extends StatelessWidget {
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
          child: UserMyPageApplyModalBodyForm(
            height: height,
            weight: weight,
            job: job,
          ),
        ));
  }
}
