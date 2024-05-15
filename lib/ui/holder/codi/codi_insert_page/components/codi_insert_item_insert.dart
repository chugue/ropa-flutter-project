import 'package:final_project_team02/ui/holder/codi/codi_item_insert_page/codi_item_insert_page.dart';
import 'package:flutter/material.dart';

class ItemInsert extends StatelessWidget {
  const ItemInsert({super.key, required this.category});

  final category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemInsertPage(category: category),
            ),
          );
        },
        child: Column(
          children: [
            Container(
              child: Container(
                width: 80,
                height: 80,
                color: Colors.grey[200],
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Text(
              category,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
