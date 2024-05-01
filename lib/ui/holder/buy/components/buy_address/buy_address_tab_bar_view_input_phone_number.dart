import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_address_tab_bar_view_input_phone_number_drop.dart';
import 'package:flutter/material.dart';

class BuyAddressTabBarViewInputPhoneNumber extends StatelessWidget {
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
            child: BuyAddressTabBarViewInputPhoneNumberDrop(),
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
