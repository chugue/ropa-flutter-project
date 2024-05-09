import 'package:final_project_team02/data/global_data/ootd.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class CodiList extends StatelessWidget {
  final CodiDetailModel? model;

  const CodiList({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // ✅한 행에 두 개의 항목
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 8.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Image.network(
              "https://picsum.photos/id/${model!.otherCodiPhotos[index].codiId + 1}/1000/1000",
              fit: BoxFit.cover);
        },
        childCount: ootdList.length + 5,
      ),
    );
  }
}
