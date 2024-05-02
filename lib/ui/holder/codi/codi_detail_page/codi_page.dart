import 'package:final_project_team02/models/popular_outfit.dart';
import 'package:final_project_team02/ui/holder/codi/components/codi_body.dart';
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
