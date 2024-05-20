import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_page.dart';
import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // Check if index is within the bounds
          if (index >= model!.codiPhotos.length) {
            return const SizedBox.shrink();
          }
          return Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CodiPage(
                                codiId: model!.codiPhotos[index].codiId,
                              )));
                },
                child: Container(
                  width: double.infinity, // 셀의 전체 너비 사용
                  height: double.infinity, // 셀의 전체 높이 사용
                  child: CachedNetworkImage(
                    imageUrl: '$baseURL${model!.codiPhotos[index].photoPath}',
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
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
        childCount: model!.codiPhotos.length,
      ),
    );
  }
}
