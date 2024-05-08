import 'package:final_project_team02/data/global_data/ootd.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_page.dart';
import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';
import 'package:flutter/material.dart';

class MoreStyleCodi extends StatelessWidget {
  final HomeModel? model;

  MoreStyleCodi({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // ✅한 행에 두 개의 항목
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 12.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CodiPage(ootd: ootdList[index])));
                },
                child: Image.network(
                  // "https://picsum.photos/400/400",
                  "https://picsum.photos/id/${model!.codiPhotos[index].photoId}/600/600",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Icon(
                  Icons.auto_awesome_motion,
                  color: Colors.white,
                ),
              )
            ],
          );
        },
        childCount: 8,
      ),
    );
  }
}
