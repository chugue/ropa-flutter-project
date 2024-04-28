class Codi {
  int id;
  List<String> mainImg;
  List<String> itemImg;

  Codi({
    required this.id,
    required this.mainImg,
    required this.itemImg,
  });
}

List<Codi> codiList = [
  Codi(id: 1, mainImg: [
    "assets/images/codi/codi01_01.jpg",
    "assets/images/codi/codi01_02.jpg",
    "assets/images/codi/codi01_03.jpg",
  ], itemImg: [
    "assets/images/item/item_01.png",
    "assets/images/item/item_02.jpg",
    "assets/images/item/item_03.png",
  ]),
  Codi(id: 2, mainImg: [
    "assets/images/codi/codi02_01.jpg",
    "assets/images/codi/codi02_02.jpg",
    "assets/images/codi/codi02_03.jpg",
  ], itemImg: [
    "assets/images/item/item_01.jpg",
    "assets/images/item/item_02.jpg",
  ]),
];
