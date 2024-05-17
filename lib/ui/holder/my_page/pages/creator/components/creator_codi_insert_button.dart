import 'package:final_project_team02/ui/holder/codi/codi_insert_page/codi_insert_page.dart';
import 'package:flutter/material.dart';

class CodiInsertButton extends StatelessWidget {
  const CodiInsertButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      right: 10,
      bottom: 0,
      child: SizedBox(
        width: 350,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CodiInsertPage(),
                ));
          },
          child: Text(
            '코디 등록하기',
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
