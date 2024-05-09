import 'package:intl/intl.dart';

class Codi {
  final int codiId;
  int? userId;
  final String description;
  DateTime? createdAt;
  final bool isLoved;
  final int loveCount;

  Codi({
    required this.codiId,
    this.userId,
    required this.description,
    this.createdAt,
    required this.isLoved,
    required this.loveCount,
  });

  factory Codi.fromJson(Map<String, dynamic> json) {
    return Codi(
      isLoved: json["isloved"],
      userId: json["userId"] ?? null,
      codiId: json["codiId"],
      description: json["description"] ?? "",
      loveCount: json["loveCount"] ?? null,
      createdAt: json["createdAt"] == null
          ? null
          : DateFormat("yyyy-MM-dd").parse(json["createdAt"]),
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
