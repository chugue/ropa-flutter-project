import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 15),
        child: Text(
          "인기 크리에이터",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18.0),
        ),
      ),
    );
  }
}
