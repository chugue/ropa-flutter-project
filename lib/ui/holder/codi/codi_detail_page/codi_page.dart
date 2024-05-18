import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_detail_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiPage extends StatelessWidget {
  final int codiId;
  const CodiPage({
    required this.codiId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CodiBody(
        codiId: codiId,
      ),
    );

  }
}
