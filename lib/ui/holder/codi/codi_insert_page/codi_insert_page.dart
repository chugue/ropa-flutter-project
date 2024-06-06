import 'package:final_project_team02/_core/constants/move.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_page_body.dart';
import 'package:final_project_team02/ui/holder/home/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiInsertPage extends ConsumerWidget {
  const CodiInsertPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
       appBar:  AppBar(
         title: Row(
           children: [
             SizedBox(
               child: InkWell(
                 onTap: () {
                   Navigator.pushNamedAndRemoveUntil(
                       context, Move.mainHolder, (_) => false);
                 },
                 child: Image.asset(
                   "assets/images/ropa_home_logo.png",
                   width: 120,
                 ),
               ),
             ),
           ],
         ),
       ),
        body: CodiInsetPageBody(),
    );
  }
}
