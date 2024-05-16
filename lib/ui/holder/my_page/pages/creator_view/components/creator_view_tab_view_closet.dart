import 'dart:convert';

import 'package:flutter/material.dart';

class CreatorViewTabViewCloset extends StatelessWidget {
  final model;

  const CreatorViewTabViewCloset({
    super.key,
    required this.model,
  });

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
