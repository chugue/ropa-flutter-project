import 'package:final_project_team02/data/dtos/buy_req.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../buy_viewmodel.dart';

class BuyOrderButton extends ConsumerWidget {
  final String text;
  final int? codiId;
  BuyModel model;

  BuyOrderButton({
    required this.text,
    required this.model,
    required this.codiId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 350,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            ref.read(buyProvider.notifier).buySave();
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            padding: EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
