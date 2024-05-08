class Codi {
  final int codiId;
  final String description;
  final String createdAt;
  final bool isloved = false;
  final int loveCount;

  const Codi({
    required this.codiId,
    required this.description,
    required this.createdAt,
    required this.loveCount,
  });

  factory Codi.fromJson(Map<String, dynamic> json) {
    return Codi(
      codiId: json["codiId"],
      description: json["description"],
      createdAt: json["createdAt"],
      loveCount: json["loveCount"],
    );
  }
//

//
}

//
// List<Codi> codiList = [
//   Codi(id: 1, mainImg: [
//     "assets/images/codi/codi01_01.jpg",
//     "assets/images/codi/codi01_02.jpg",
//     "assets/images/codi/codi01_03.jpg",
//   ], itemImg: [
//     "assets/images/item/item_01.png",
//     "assets/images/item/item_02.jpg",
//     "assets/images/item/item_03.png",
//   ]),
//   Codi(id: 2, mainImg: [
//     "assets/images/codi/codi02_01.jpg",
//     "assets/images/codi/codi02_02.jpg",
//     "assets/images/codi/codi02_03.jpg",
//   ], itemImg: [
//     "assets/images/item/item_01.jpg",
//     "assets/images/item/item_02.jpg",
//   ]),
// ];
