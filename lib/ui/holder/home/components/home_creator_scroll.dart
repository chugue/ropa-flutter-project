import 'package:final_project_team02/ui/holder/home/home_viewmodel.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/creator_view/creator_view_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CreatorScroll extends ConsumerWidget {
  const CreatorScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeModel? model = ref.watch(homeProvider);

    if (model == null) {
      return CircularProgressIndicator();
    }else{
      return SliverToBoxAdapter(
        child: SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: model!.userPhotos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreatorViewPage()),
                      );
                    },
                    child: Container(
                      width: 70,
                      child: Image.network(
                        "https://picsum.photos/id/${model.userPhotos[index].photoId}/600/600",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );

    }

    print('Item count: ${model!.userPhotos.length}');

  }

}
