import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '_address_search.dart';
import '_leftside_title.dart';
import '_mobile_input.dart';
import '_small_title.dart';
import '_text_form.dart';

class InputAddress extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          children: [
            LeftSideTitle(),
            Expanded(
              flex: 2,
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextForm(text: "이름"),
                    SizedBox(height: 15),
                    AddressSearch(),
                    SizedBox(height: 15),
                    TextForm(text: "기본주소"),
                    SizedBox(height: 15),
                    TextForm(text: "나머지 주소 (선택 입력 가능)"),
                    SizedBox(height: 15),
                    MobileInput(),
                    SizedBox(height: 15),
                    EmailField(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 100,
          child: TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black26,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 5,
          child: Center(
            child: Text(
              " @ ",
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ),
        // EmailDropDown(),
      ],
    );
  }
}

class EmailDropDown extends StatefulWidget {
  const EmailDropDown({super.key});

  @override
  State<EmailDropDown> createState() => _EmailDropDownState();
}

class _EmailDropDownState extends State<EmailDropDown> {
  final List<String> list = <String>['gmail.com', 'naver.com', 'hanmail.net'];
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = list.first;
  }

  void _showModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          height: 400,
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      title: Text(list[index]),
                      onTap: () {
                        setState(() {
                          dropdownValue = list[index];
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Divider(height: 1),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showModal,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black38),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                dropdownValue ?? '010',
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ),
            Icon(Ionicons.chevron_down_outline, size: 16),
          ],
        ),
      ),
    );
  }
}
