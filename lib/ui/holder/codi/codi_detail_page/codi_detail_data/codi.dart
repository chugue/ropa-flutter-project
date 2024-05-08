class Codi {
  final int codiId;
  final String description;
  final DateTime? createdAt;

  final bool isloved = false;
  final int loveCount;

  const Codi({
    required this.codiId,
    required this.description,
    this.createdAt,
    required this.loveCount,
  });

  factory Codi.fromJson(Map<String, dynamic> json) {
    return Codi(
      codiId: json["codiId"],
      description: json["description"],
      loveCount: json["loveCount"],
      createdAt: json["createdAt"] ?? "",
    );
  }
}
