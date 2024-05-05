import 'package:final_project_team02/data/domain_data/ootd.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_page_body.dart';
import 'package:flutter/material.dart';

class CodiPage extends StatelessWidget {
  const CodiPage({super.key, required this.ootd});

  final Ootd ootd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CodiBody(ootd: ootd),
    );
  }
}
