import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'components/item_page_body.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      appBar: AppBar(), // TODO: Empty AppBar
      body: ItemPageBody(),
    );
  }
}
