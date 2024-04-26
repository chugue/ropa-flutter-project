import 'package:final_project_team02/holder/buy/widget/address_tab_view.dart';
import 'package:final_project_team02/holder/buy/widget/delivery_request.dart';
import 'package:final_project_team02/holder/buy/widget/main_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(CupertinoIcons.chevron_left),
        toolbarHeight: 45,
      ),
      body: ListView(
        children: [
          PageTitle(),
          AddressTab(),
          DelieveryRequest(),
        ],
      ),
    );
  }
}
