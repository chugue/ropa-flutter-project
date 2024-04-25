class Codi {
  int id;
  List<String> mainImg;

  Codi({
    required this.id,
    required this.mainImg,
  });
}

List<Codi> codiList = [
  Codi(id: 1, mainImg: [
    "assets/images/codi/codi01_01.jpg",
    "assets/images/codi/codi01_02.jpg",
    "assets/images/codi/codi01_03.jpg",
  ]),
  Codi(id: 2, mainImg: [
    "assets/images/codi/codi02_01.jpg",
    "assets/images/codi/codi02_02.jpg",
    "assets/images/codi/codi02_03.jpg",
  ]),
];
