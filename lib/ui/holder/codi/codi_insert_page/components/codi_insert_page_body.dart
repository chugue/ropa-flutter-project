import 'package:final_project_team02/data/dtos/codi_req.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_styling_comment.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_sub_title.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_title.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_pic_insert_scroll.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_pic_item_insert_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiInsetPageBody extends ConsumerWidget {
  const CodiInsetPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    SessionData sessionData = ref.read(sessionProvider); // 세션 데이터 읽기
    CodiInsertModel model = ref.watch(codiInsertProvider); // CodiInsertModel 데이터 읽기

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CodiInsertTitle(),
            SizedBox(height: 20.0),

            CodiPicInsertScroll(),
            SizedBox(height: 50),

            CodiInsertSubTitle(subTitle: "착용 아이템"),
            CodiPicItemInsertScroll(),
            SizedBox(height: 50),

            CodiInsertSubTitle(subTitle: "스타일링 코멘트"),
            StylingComment(),


            ElevatedButton(
              onPressed: () {
                List<Items> items = [];
                List<CodiPhots> codiPhotos = [];

                if (model.topPhotoPath != null) {
                  items.add(Items(
                      brandId: model.topBrandId, itemsId: model.topImageId));
                  codiPhotos.add(CodiPhots(
                    photoName: model.fileName,
                    photoBase64: model.prevImg,
                    type: "CODI",
                    isMainPhoto: model.isMainPhoto ?? false,
                  ));
                }

                if (model.bottomPhotoPath != null) {
                  items.add(Items(
                      brandId: model.bottomBrandId,
                      itemsId: model.bottomImageId));
                  codiPhotos.add(CodiPhots(
                    photoName: model.fileName,
                    photoBase64: model.prevImg,
                    type: "CODI",
                    isMainPhoto: model.isMainPhoto ?? false,
                  ));
                }
                print('😒😒😒${model.comment}');
                CodiInsertReqDTO reqDTO = CodiInsertReqDTO(
                  title: null,
                  userId: sessionData.user!.id!,
                  description: model.comment, // Set your description here
                  codiPhotos: codiPhotos,
                  items: items,
                );

                ref.read(codiInsertProvider.notifier).codiSave(reqDTO);
              }
              ,
              child: const Text('완료'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(double.infinity, 50),
                ), // 가로 길이 조정
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ), // 기본 양쪽 둥글 -> 모서리만 5px둥글게
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

