import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_data/codi_insert.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiPicInsertScroll extends ConsumerWidget {
  const CodiPicInsertScroll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CodiInsertModel? model = ref.watch(codiInsertProvider);

    return Container(
      height: 120,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int CodiIndex) {
          return Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model!.images.length + 1,
              itemBuilder: (context, int index) {
                if (index == model.images.length) {
                  return GestureDetector(
                    onTap: () async {
                      await ref
                          .read(codiInsertProvider.notifier)
                          .pickAndAddCodiImage();
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.grey[400],
                      ),
                    ),
                  );
                } else {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        width: 120,
                        height: 120,
                        child: CachedNetworkImage(
                          imageUrl: model.images[index].path,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            ref
                                .read(codiInsertProvider.notifier)
                                .removeImage(index);
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if (index == 0)
                        Positioned(
                          top: 5,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            color: Colors.black.withOpacity(0.5),
                            child: Text(
                              "대표",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

//
// class CodiInsertScroll extends ConsumerWidget {
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     CodiInsertModel? model = ref.watch(codidInsertProvider);
//
// }
// //
// // Container(
// // margin: EdgeInsets.only(right: 16),
// // width: 120,
// // height: 120,
// // color: Colors.grey[200],
// // child:
// // Icon(
// // Icons.add,
// // size: 40,
// // color: Colors.grey[400],
// // ),
// // )
// // class CodiInsertScroll2 extends ConsumerWidget {
// //   const CodiInsertScroll2({super.key});
// //
// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final model = ref.watch(codidInsertProvider);
// //
// //     return Container(
// //       height: 120,
// //       child: ListView.builder(
// //         scrollDirection: Axis.horizontal,
// //         itemCount: model!.imageFiles.length + 1, // Add one for the 'add' button
// //         itemBuilder: (context, index) {
// //           if (index == model!.imageFiles.length) { // 'Add' button
// //             return GestureDetector(
// //               onTap: () => ref.read(codidInsertProvider.notifier).pickAndAddImage(),
// //               child: Container(
// //                 width: 120,
// //                 height: 120,
// //                 color: Colors.grey[200],
// //                 child: Icon(Icons.add, size: 40, color: Colors.grey[400]),
// //               ),
// //             );
// //           } else {
// //             return Container(
// //               margin: EdgeInsets.only(right: 16),
// //               width: 120,
// //               height: 120,
// //               child: Image.memory(base64Decode(model!.imagesBase64[index]),
// //                   fit: BoxFit.cover),
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
