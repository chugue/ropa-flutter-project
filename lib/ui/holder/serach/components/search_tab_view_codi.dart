import 'package:flutter/material.dart';

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
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
      ),
      itemCount: 42,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 4,
                  child: ClipRRect(
                    child: Image.network(
                        // "https://picsum.photos/400/400",
                        "https://picsum.photos/id/${index + 1}/600/600",
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("옷제목",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "옷설명",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    //numberFormat 사용하면되
                    Text(
                      "가격 : 10,000원",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
