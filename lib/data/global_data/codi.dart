import 'package:intl/intl.dart';

class Codi {
  final int codiId;
  final String description;
  final DateTime createdAt;
  final bool isLoved;
  final int loveCount;

  const Codi({
    required this.codiId,
    required this.isLoved,
    required this.description,
    required this.createdAt,
    required this.loveCount,
  });

  factory Codi.fromJson(Map<String, dynamic> json) {
    return Codi(
      isLoved: json["isloved"],
      codiId: json["codiId"],
      description: json["description"],
      loveCount: json["loveCount"] ?? null,
      createdAt: DateFormat("yyyy-mm-dd").parse(json["createdAt"]),
    );
  }
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
