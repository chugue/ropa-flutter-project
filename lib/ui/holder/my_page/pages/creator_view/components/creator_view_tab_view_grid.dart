import 'dart:convert';

import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:flutter/material.dart';

class CreatorViewTabViewGird extends StatelessWidget {
  final CreatorModel model;

  const CreatorViewTabViewGird({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext contextf) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 2,
        crossAxisCount: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: model!.codiList.length,
      itemBuilder: (context, codiIndex) {
        return Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SizedBox()));
              },
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.memory(
                    base64Decode(model!.codiList[codiIndex].base64),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Icon(
                Icons.auto_awesome_motion,
                color: Colors.white,
              ),
              //auto_awesome_motion
              //style
              //filter_none
            )
          ],
        );
      },
    );
  }
}
