import 'package:flutter/material.dart';

import '../../../../components/logo.dart';
import 'join_page_from.dart';

class JoinBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Logo(width: 250, height: 150),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: JoinFrom(),
          ),
        ),
      ],
    );
  }
}
