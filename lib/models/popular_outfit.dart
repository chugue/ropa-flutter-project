class Ootd {
  final id;
  final Img;
  final like;
  late final meLike;

  Ootd({
    required this.id,
    required this.Img,
    required this.like,
    required this.meLike,
  });
}

/* ✅샘플 데이터 */
List<Ootd> ootdList = [
  Ootd(
    id: 1,
    Img: "assets/images/ootd/ootd01.jpg",
    like: 912,
    meLike: false,
  ),
  Ootd(
    id: 2,
    Img: "assets/images/ootd/ootd02.webp",
    like: 1000,
    meLike: true,
  ),
  Ootd(
    id: 3,
    Img: "assets/images/ootd/ootd03.webp",
    like: 119,
    meLike: true,
  ),
  Ootd(
    id: 4,
    Img: "assets/images/ootd/ootd04.webp",
    like: 96,
    meLike: false,
  ),
  Ootd(
    id: 5,
    Img: "assets/images/ootd/ootd05.webp",
    like: 03,
    meLike: true,
  ),
  Ootd(
    id: 6,
    Img: "assets/images/ootd/ootd06.webp",
    like: 22,
    meLike: false,
  ),
];
