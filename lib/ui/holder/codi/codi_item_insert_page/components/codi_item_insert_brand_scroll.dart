import 'package:final_project_team02/models/brand.dart';
import 'package:flutter/cupertino.dart';

class BrandScroll extends StatelessWidget {
  const BrandScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  brands[index].logo,
                  width: 60,
                  height: 60,
                ),
                SizedBox(height: 4),
                Text(
                  brands[index].name,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
