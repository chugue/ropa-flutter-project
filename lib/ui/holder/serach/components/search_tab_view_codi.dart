import 'package:final_project_team02/ui/holder/codi/codi_detail_page/codi_page.dart';
import 'package:flutter/material.dart';

import '../../../../data/domain_data/popular_outfit.dart';

class SearchTabViewCodi extends StatelessWidget {
  const SearchTabViewCodi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 2,
        crossAxisCount: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CodiPage(ootd: ootdList.first)));
              },
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                    "https://picsum.photos/id/${index + 1}/1000/1000",
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Icon(
                Icons.auto_awesome_motion,
                color: Colors.white,
              ),
              //auto_awesome_motion
              //style
              //filter_none
            )
          ],
        );
      },
    );
  }
}
