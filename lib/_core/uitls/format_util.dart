
import 'package:intl/intl.dart';

String formatCurrency(int amount) {
  final formatter = NumberFormat('#,###원', 'ko_KR');
  return formatter.format(amount);
}