import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseAddress extends StatefulWidget {
  const ChooseAddress({
    super.key,
  });

  @override
  State<ChooseAddress> createState() => _ChooseAddressState();
}

class _ChooseAddressState extends State<ChooseAddress> {
  String _selectedOption = "option1"; // 초기 선택된 옵션
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: Text(
                  "회원 정보와 동일",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: "option1",
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: Text("새로운 배송지",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                value: "option2",
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
