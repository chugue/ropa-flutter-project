import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_viewmodel.dart';
import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodiInsertPage extends ConsumerWidget /* TODO : tl or stf? */ {
  const CodiInsertPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionData = ref.read(sessionProvider); // 세션 데이터 읽기
    CodiInsertModel model =
        ref.read(codiInsertProvider); // CodiInsertModel 데이터 읽기

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {},
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
