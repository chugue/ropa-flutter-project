import 'package:flutter/material.dart';

import '_dropdown_numbers.dart';

class MobileInput extends StatelessWidget {
  const MobileInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 70,
            child: DropDownNumbers(),
          ),
          Container(
            child: Text(
              " – ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 65,
            child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black26,
                  ),
                ),
              ),
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            child: Text(
              " – ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              child: TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 15,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
