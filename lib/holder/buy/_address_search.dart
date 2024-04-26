import 'package:flutter/material.dart';

class AddressSearch extends StatelessWidget {
  const AddressSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.black45),
                top: BorderSide(color: Colors.black45),
                bottom: BorderSide(color: Colors.black45),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "우편번호",
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12.5, vertical: 11),
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black45,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: InkWell(
            onTap: () {}, //여기에 주소 검색 API 걸면 될듯! //TODO
            child: Center(
                child: Text(
              "주소검색",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    );
  }
}
