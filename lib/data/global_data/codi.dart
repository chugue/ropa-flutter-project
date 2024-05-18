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

  Codi copyWith({
    int? codiId,
    int? userId,
    String? description,
    DateTime? createdAt,
    bool? isLoved,
    int? loveCount,
  }) {
    return Codi(
      codiId: codiId ?? this.codiId,
      userId: userId ?? this.userId,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      isLoved: isLoved ?? this.isLoved,
      loveCount: loveCount ?? this.loveCount,
    );
  }
}
