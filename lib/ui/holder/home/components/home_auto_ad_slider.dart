import 'package:final_project_team02/data/global_data/slide_ad.dart';
import 'package:flutter/cupertino.dart';

class AutoAdSlider extends StatelessWidget {
  const AutoAdSlider({
    super.key,
    required this.slideAd,
  });

  final SlideAd slideAd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9 /* TODO : 적용 안되는 것 같음 */,
      child: Image.asset(
        slideAd.adImg,
        fit: BoxFit.cover,
      ),
    );
  }
}
