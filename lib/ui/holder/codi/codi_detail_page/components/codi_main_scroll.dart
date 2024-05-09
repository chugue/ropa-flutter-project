import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiMainScroll extends ConsumerWidget {
  final CodiDetailModel? model;

  const CodiMainScroll({
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, codiIndex) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: model!.mainPhotos.length,
              itemBuilder: (context, index) {
                // 각 코디의 이미지 리스트에 대한 페이지 뷰 빌드
                return Image.network(
                    "https://picsum.photos/id/${model!.mainPhotos[index].mainPhotoId}/1000/1000",
                    fit: BoxFit.cover);
              },
            ),
          );
        },
      ),
    );
  }
}
