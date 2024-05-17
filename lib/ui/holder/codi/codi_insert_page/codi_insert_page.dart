import 'package:final_project_team02/data/dtos/codi_req.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiInsertPage extends ConsumerWidget {
  const CodiInsertPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionData sessionData = ref.read(sessionProvider); // 세션 데이터 읽기
    CodiInsertModel model =
        ref.read(codiInsertProvider); // CodiInsertModel 데이터 읽기

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                List<Items> items = [];
                List<CodiPhots> codiPhotos = [];

                if (model.topImageBase64 != null) {
                  items.add(Items(
                      brandId: model.topBrandId, itemsId: model.topImageId));
                  codiPhotos.add(CodiPhots(
                    photoName: model.topItemName ?? 'topImage',
                    photoBase64: model.topImageBase64!,
                    type: "CODI",
                    isMainPhoto: model.isMainPhoto ?? false,
                  ));
                }

                if (model.bottomImageBase64 != null) {
                  items.add(Items(
                      brandId: model.bottomBrandId,
                      itemsId: model.bottomImageId));
                  codiPhotos.add(CodiPhots(
                    photoName: model.bottomItemName ?? 'bottomImage',
                    photoBase64: model.bottomImageBase64!,
                    type: "CODI",
                    isMainPhoto: model.isMainPhoto ?? false,
                  ));
                }

                CodiInsertReqDTO reqDTO = CodiInsertReqDTO(
                  userId: sessionData.user!.id!,
                  title:' 코디 1 ',
                  description: model.comment, // Set your description here
                  codiPhotos: codiPhotos,
                  items: items,
                );
                
                ref.read(codiInsertProvider.notifier).codiSave(reqDTO);
              },
              child: Text(
                "완료",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
      body: CodiInsetPageBody(),
    );
  }
}
