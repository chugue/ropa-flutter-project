import 'dart:convert';

import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/creator_view_page.dart';
import 'package:flutter/material.dart';

class CreatorScroll extends StatelessWidget {
  final HomeModel? model;

  CreatorScroll({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model!.userPhotos.length, // 2
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreatorViewPage(
                              creatorId: model!.userPhotos[index].creatorId,
                            )),
                  );
                },
                child: Container(
                  width: double.infinity, // 셀의 전체 너비 사용
                  height: double.infinity, // 셀의 전체 높이 사용
                  child: Image.memory(
                    Base64Decoder()
                        .convert(model!.userPhotos[index].base64),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
