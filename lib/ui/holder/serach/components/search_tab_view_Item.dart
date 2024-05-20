import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_team02/ui/holder/item/item_page.dart';
import 'package:final_project_team02/ui/holder/serach/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../_core/constants/http.dart';

class SearchTabViewItem extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SearchModel? model = ref.watch(searchProvider);

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
      ),
      itemCount: model!.itemPhotos.length,
      itemBuilder: (context, index) {
        Logger().d('$baseURL${model.itemPhotos[index].photoPath}');

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemPage(
                                  itemId: model.itemPhotos[index].itemsId,
                                  codiId: model.codiPhotos[index].codiId,
                                )));
                  },
                  child: AspectRatio(
                    aspectRatio: 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl:
                            '$baseURL${model!.itemPhotos[index].photoPath}',
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
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("옷제목",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "옷설명",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "가격 : 10,000원",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
