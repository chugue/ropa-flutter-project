import 'package:final_project_team02/ui/holder/port_one/components/Iamport_certification.dart';
import 'package:final_project_team02/ui/holder/port_one/model/certification_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Certification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String userCode = Get.arguments['userCode'] as String;
    CertificationData data = Get.arguments['data'] as CertificationData;

    return IamportCertification(
      appBar: AppBar(
        title: Text('아임포트 본인인증'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      initialChild: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/iamport-logo.png'),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ),
      userCode: userCode,
      data: data,
      callback: (Map<String, String> result) {
        Get.offNamed('/certification-result', arguments: result);
      },
    );
  }
}
