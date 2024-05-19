import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_page.dart';
import 'package:final_project_team02/ui/holder/serach/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
import 'package:shimmer/shimmer.dart';

class SearchTabViewCodi extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SearchModel? model = ref.watch(searchProvider);

    // Logger().d(model);

    // // 상태 변화 모니터링 및 초기화
    // ref.listen<SearchModel?>(searchProvider, (previous, next) {
    //   if (previous == null && next != null) {
    //   } else if (next == null) {
    //     ref.read(searchProvider.notifier).notifyInit();
    //   }
    // });

    // Logger().d(model);

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 2,
        crossAxisCount: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: model!.codiPhotos.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CodiPage(codiId: model.codiPhotos[index].codiId)));
              },
              child: AspectRatio(
                aspectRatio: 1,
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
