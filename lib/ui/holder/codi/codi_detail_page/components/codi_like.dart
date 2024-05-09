import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiLike extends ConsumerWidget {
  final CodiDetailModel model;

  const CodiLike({
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              onPressed: () {
                ref
                    .read(codiDetailProvider(model.codi.codiId).notifier)
                    .loveCount(model.codi.codiId);
              },
              icon: Icon(Icons.favorite,
                  color: model.codi.isLoved ? Colors.red : Colors.grey),
            ),
            Text("${model.codi.loveCount}"),
          ],
        ),
      ),
    );
  }
}
