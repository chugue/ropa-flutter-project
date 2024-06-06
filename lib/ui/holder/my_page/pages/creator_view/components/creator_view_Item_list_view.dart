import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/_core/uitls/format_util.dart';
import 'package:final_project_team02/ui/holder/item/item_page.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/creator_view_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CreatorViewItemListView extends StatelessWidget {
  const CreatorViewItemListView({
    super.key,
    required this.model,
  });

  final CreatorVModel model;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
      ),
      itemCount: model!.itemList.length,
      itemBuilder: (context, index) {
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
                            itemId: model.itemList[index].itemId,
                            codiId: model.codiList[index].codiId),
                      ),
                    );
                  },
                  child: AspectRatio(
                    aspectRatio: 2 / 1,
                    child: ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl: '$baseURL${model.itemList[index].photoPath}',
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
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.itemList[index].name.length > 15
                          ? model.itemList[index].name.substring(0, 15) + "..."
                          : model.itemList[index].name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    // Text(model.itemList[itemIndex].description,
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       overflow: TextOverflow.ellipsis,
                    //     )),
                    Text(
                      "${formatCurrency(model.itemList[index].price)}",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
