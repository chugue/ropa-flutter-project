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
      height: 100, // 적절한 높이 지정
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // 가로 스크롤 설정
        itemCount: model!.userPhotos.length, // 아이템 개수
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, top: 15),

            child: Container(
              width: 90,
              height: 50,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreatorViewPage(
                        creatorId: model!.userPhotos[index].creatorId,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.memory(
                    Base64Decoder().convert(model!.userPhotos[index].base64),
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
