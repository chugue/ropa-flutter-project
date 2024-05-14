import 'dart:convert';

import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiInsertScroll extends ConsumerWidget {
  const CodiInsertScroll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CodiInsertModel? model = ref.watch(codidInsertProvider);

    model != null
        ? print("😍😍😍😍😍${model!.imageFiles.length}")
        : print("▶️▶️▶️▶️▶️▶️▶️");

    if (model != null) {
      return Container(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model != null ? model.imageFiles.length + 1 : 2,
          // 이미지 추가 버튼 포함
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                await ref.read(codidInsertProvider.notifier).pickAndAddImage();
              },
              child: Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 120,
                  height: 120,
                  color: Colors.grey[200],
                  child: Image.memory(base64Decode(model!.imagesBase64[0]))),
            );
          },
        ),
      );
    } else {
      return Container(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2, // 이미지 추가 버튼 포함
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                await ref.read(codidInsertProvider.notifier).pickAndAddImage();
              },
              child: Container(
                margin: EdgeInsets.only(right: 16),
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
          },
        ),
      );
    }
  }
}
//
// Container(
// margin: EdgeInsets.only(right: 16),
// width: 120,
// height: 120,
// color: Colors.grey[200],
// child:
// Icon(
// Icons.add,
// size: 40,
// color: Colors.grey[400],
// ),
// )
// class CodiInsertScroll2 extends ConsumerWidget {
//   const CodiInsertScroll2({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final model = ref.watch(codidInsertProvider);
//
//     return Container(
//       height: 120,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: model!.imageFiles.length + 1, // Add one for the 'add' button
//         itemBuilder: (context, index) {
//           if (index == model!.imageFiles.length) { // 'Add' button
//             return GestureDetector(
//               onTap: () => ref.read(codidInsertProvider.notifier).pickAndAddImage(),
//               child: Container(
//                 width: 120,
//                 height: 120,
//                 color: Colors.grey[200],
//                 child: Icon(Icons.add, size: 40, color: Colors.grey[400]),
//               ),
//             );
//           } else {
//             return Container(
//               margin: EdgeInsets.only(right: 16),
//               width: 120,
//               height: 120,
//               child: Image.memory(base64Decode(model!.imagesBase64[index]),
//                   fit: BoxFit.cover),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class CodiInsertScroll2 extends ConsumerWidget {
//   const CodiInsertScroll2({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//     CodiInsertModel? model = ref.watch(codidInsertProvider);
//     XFile? _imageFile;
//
//     String pushImage;
//     Future<void> _pickImage() async {
//       final ImagePicker picker = ImagePicker();
//       final XFile? selectedImage =
//           await picker.pickImage(source: ImageSource.gallery);
//     }
//
//     return Container(
//       height: 120,
//       child: PageView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, int CodiIndex) {
//           return Container(
//             height: 120,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 2 /* ✅TODO : 추 후 + 1 */,
//               itemBuilder: (context, int index) {
//                 if (index == 2 - 1) /* ✅-1 지울 것*/ {
//                   return GestureDetector(
//                     onTap: () async {
//                       await ref.read(codidInsertProvider.notifier).pickAndAddImage();
//
//
//                       // final ImagePicker picker = ImagePicker();
//                       // XFile? selectedImage = await picker.pickImage(source: ImageSource.gallery);
//                       // print("😁😁😁😁😁😁{$selectedImage}");
//                       // String pushImage = await ref.read(codidInsertProvider.notifier).convertToBase64(selectedImage!);
//                       // print("❤️❤️❤️❤️❤️❤️❤️{$pushImage}");
//                       //
//                       // ref.read(codidInsertProvider.notifier).setMainImg(pushImage);
//
//
//                     },
//                     child: Container(
//                       width: 120,
//                       height: 120,
//                       color: Colors.grey[200],
//                       child: Icon(
//                         Icons.add,
//                         size: 40,
//                         color: Colors.grey[400],
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Stack(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(right: 16),
//                         width: 120,
//                         height: 120,
//                         child: Image.network(
//                             "https://picsum.photos/id/${index + 1}/1000/1000",
//                             fit: BoxFit.cover),
//                       ),
//                       if (index == 0) /* ✅mainImg의 index, 추후 로직 변경*/
//                         Positioned(
//                           top: 5,
//                           right: 10,
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 5, vertical: 2),
//                             color: Colors.black.withOpacity(0.5),
//                             child: Text(
//                               "대표",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 10,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   );
//                 }
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
