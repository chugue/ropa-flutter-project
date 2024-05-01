import 'package:final_project_team02/ui/holder/port_one/model/pg/naver/naver_co_products.dart';
import 'package:final_project_team02/ui/holder/port_one/model/pg/naver/naver_pay_products.dart';
import 'package:json_annotation/json_annotation.dart';

part 'naver_products.g.dart';

@JsonSerializable(createFactory: false)
abstract class NaverProducts {
  NaverProducts();

  factory NaverProducts.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      return NaverCoProducts.fromJson(json);
    } else {
      return NaverPayProducts.fromJson(json);
    }
  }
}
