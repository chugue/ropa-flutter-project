import 'package:final_project_team02/holder/buy/components/buy_page_body_address/buy_main_address_delivery_address_tab_input_address_rightside_mobile_input_dropdown_numbers.dart';
import 'package:flutter/material.dart';

class MobileInput extends StatelessWidget {
  const MobileInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
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
