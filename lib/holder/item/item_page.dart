import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/item_body.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      appBar: AppBar(), // TODO: Empty AppBar
      body: ItemBody(),
    );
  }
}