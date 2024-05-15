import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/order_repo.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/order/order_data/item_history_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderHistoryModel {
  final List<ItemHistoryList> itemHistoryList;

  const OrderHistoryModel({
    required this.itemHistoryList,
  });
}

class OrderHistoryViewModel extends StateNotifier<OrderHistoryModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  OrderHistoryViewModel(super.state, this.ref);

  Future<void> notifyinit() async {
    ResponseDTO responseDTO = await OrderRepo().callOrderHistoryList();
    print(responseDTO.toString());
    if (responseDTO.success) {
      state = responseDTO.response;
    }
  }
}

final orderHistoryProvider =
    StateNotifierProvider<OrderHistoryViewModel, OrderHistoryModel?>((ref) {
  return OrderHistoryViewModel(null, ref)..notifyinit();
});
