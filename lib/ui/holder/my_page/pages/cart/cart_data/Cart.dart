import 'package:final_project_team02/data/global_data/admin_info.dart';
import 'package:intl/intl.dart';

class Cart {
  final int userId;
  final int totalCartPrice;

  const Cart({
    required this.totalCartPrice,
    required this.userId,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      userId: json["userId"],
      totalCartPrice: json["totalCartPrice"],
    );
  }

  // copyWith 메소드 추가
  Cart copyWith({
    int? userId,
    int? totalCartPrice,
  }) {
    return Cart(
      userId: userId ?? this.userId,
      totalCartPrice: totalCartPrice ?? this.totalCartPrice,
    );
  }
}
