import 'package:final_project_team02/models/popular_outfit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '_popular_ootd.dart';

class OotdScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ootdList.length,
          itemBuilder: (context, index) {
            return PopularOotd(
              ootd: ootdList[index],
            );
          },
        ),
      ),
    );
  }
}
