class SlideAd {
  final id;
  final adImg;

  SlideAd({
    required this.id,
    required this.adImg,
  });
}

/* ✅샘플 데이터 */
List<SlideAd> slideAdList = [
  SlideAd(
    id: 1,
    adImg: "assets/images/slide_ad/slide_img01.gif",
  ),
  SlideAd(
    id: 2,
    adImg: "assets/images/slide_ad/slide_img02.jpg",
  ),
  SlideAd(
    id: 3,
    adImg: "assets/images/slide_ad/slide_img03.jpg",
  ),
  SlideAd(
    id: 4,
    adImg: "assets/images/slide_ad/slide_img04.jpg",
  ),
  SlideAd(
    id: 5,
    adImg: "assets/images/slide_ad/slide_img05.jpg",
  ),
];
