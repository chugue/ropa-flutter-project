import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/buy_box_divider.dart';
import 'components/buy_main_address.dart';
import 'components/main_order_title.dart';

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
          BuyMainAddress(),
          BuyBoxDivider(),
          MainOrderTitle(),
          BuyBoxDivider(),
        ],
      ),
    );
  }
}
