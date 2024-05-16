import 'dart:convert';

import 'package:final_project_team02/ui/holder/my_page/pages/creator/creator_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatorViewTabViewCloset extends ConsumerWidget {
  const CreatorViewTabViewCloset({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CreatorModel? model = ref.watch(creatorProvider(1));
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
      ),
      itemCount: model!.itemList.length,
      itemBuilder: (context, itemIndex) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SizedBox()));
                  },
                  child: AspectRatio(
                    aspectRatio: 2 / 1,
                    child: ClipRRect(
                      child:
                          // Image.network(
                          //     "https://picsum.photos/id/${index + 1}/600/600",
                          Image.memory(
                              base64Decode(model!.itemList[itemIndex].base64),
                              fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model!.itemList[itemIndex].name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(model!.itemList[itemIndex].description,
                        style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        )),
                    //numberFormat 사용하면되
                    Text(
                      "${model!.itemList[itemIndex].price} 원",
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
