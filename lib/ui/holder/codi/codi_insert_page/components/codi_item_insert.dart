import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class CodiItemInsert extends ConsumerWidget {
  const CodiItemInsert({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CodiInsertModel model = ref.watch(codiInsertProvider);

    String? photoPath;;

    if (category == 'top') {
      photoPath = model.topPhotoPath;
    } else if (category == 'bottom') {
      photoPath = model.bottomPhotoPath;
    }


    if (photoPath == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 16.0),
        child: GestureDetector(
          onTap: () {
            ref
                .read(codiItemInsertProvider(category).notifier)
                .callItemInsert(category);
          },
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                color: Colors.grey[200],
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
              Text(
                category,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 80,
            height: 80,
            child: CachedNetworkImage(
              imageUrl:
              '$baseURL${photoPath}',
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
    }
  }
}
