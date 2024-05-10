import 'package:final_project_team02/ui/holder/my_page/pages/user/components/apply/user_my_page_apply_modal_body_form.dart';
import 'package:flutter/material.dart';

class UserMyPageApplyModalBody extends StatelessWidget {
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _instagram = TextEditingController();
  String? _selectedJob;
  final _formKey = GlobalKey<FormState>();

  void _handleJobChange(String? newJob) {
    _selectedJob = newJob;
    print("Job selected: $_selectedJob");
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 10,
        right: 10,
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: UserMyPageApplyModalBodyForm(
            formKey: _formKey,
            pHeight: _height,
            pWeight: _weight,
            pInstagram: _instagram,
            onJobSelected: _handleJobChange,
          ),
        ));
  }
}
