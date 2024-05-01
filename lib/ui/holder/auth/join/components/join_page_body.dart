import 'package:flutter/material.dart';

import '../../../../components/logo.dart';
import 'join_page_from.dart';

class JoinPageBody extends StatelessWidget {
  const JoinPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Logo(width: 250, height: 250),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: JoinPageFrom(),
          ),
        ),
      ],
    );
  }
}
