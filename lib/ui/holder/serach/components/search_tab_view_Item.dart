import 'dart:convert';

import 'package:final_project_team02/ui/holder/serach/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchTabViewItem extends ConsumerWidget {


  SearchTabViewItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SearchModel? model = ref.watch(searchProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }else{
      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 1,
          crossAxisCount: 2,
          mainAxisSpacing: 0,
        ),
        itemCount: model.itemPhotos.length,
        itemBuilder: (context, index) {
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
                      aspectRatio: 4,
                      child: ClipRRect(
                        child: Image.memory(
                          Base64Decoder()
                              .convert(model.itemPhotos[index].base64),
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
                      //numberFormat 사용하면되
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
}
