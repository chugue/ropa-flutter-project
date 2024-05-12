import 'package:final_project_team02/ui/holder/codi/codi_insert_page/components/codi_insert_page_body.dart';
import 'package:flutter/material.dart';

class CodiInsertPage extends StatelessWidget /* TODO : tl or stf? */ {
  const CodiInsertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                print("완료 버튼 클릭 됨.");
              },
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
