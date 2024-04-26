import 'package:flutter/material.dart';
import '../../../../components/Logo.dart';
import 'join_page_from.dart';

class join_page_body extends StatelessWidget {
  const join_page_body({
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
