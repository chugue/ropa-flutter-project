import 'package:final_project_team02/ui/holder/codi/codi_detail_page/components/codi_body.dart';
import 'package:flutter/material.dart';

class CodiPage extends StatelessWidget {
  final int codiId;
  const CodiPage({
    required this.codiId,
  });

  @override
  Widget build(BuildContext context) {
    print('${codiId}');
    print('🤣🤣🤣🤣🤣🤣${codiId}');
    print('${codiId}');

    return Scaffold(
      body: CodiBody(
        codiId: codiId,
      ),
    );
  }
}
