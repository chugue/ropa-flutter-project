import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:flutter/material.dart';

class CodiContent extends StatelessWidget {
  final CodiDetailModel? model;

  const CodiContent({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "${model!.codi.description}",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
