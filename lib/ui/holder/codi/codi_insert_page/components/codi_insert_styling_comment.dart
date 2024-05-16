import 'package:final_project_team02/_core/uitls/validator_util.dart';
import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StylingComment extends ConsumerWidget {
  const StylingComment({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      maxLength: 150,
      maxLines: null,
      minLines: 3,
      validator: validateContent(),
      onChanged: (value) =>
          ref.read(codiItemInsertProvider(value).notifier).updateComment(value),
      decoration: InputDecoration(
        hintText: "스타일링 포인트는 무엇인가요?",
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        // 상하 여백 조절
        hintStyle: TextStyle(color: Colors.grey), // hintText의 위치 조
      ),
    );
  }
}
