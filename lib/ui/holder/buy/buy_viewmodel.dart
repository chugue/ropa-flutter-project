import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/item_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/buy.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/cart_infos.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/order_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyModel {
  final Buy buy;
  final List<CartInfos> cartInfos;
  final OrderInfo orderInfo;

  const BuyModel({
    required this.buy,
    required this.cartInfos,
    required this.orderInfo,
  });
}

class BuyViewModel extends StateNotifier<BuyModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  SessionData sessionData;

  BuyViewModel(super.state, this.ref, this.sessionData);

  Future<void> notifyInit(int itemId) async {
    ResponseDTO responseDTO = await ItemRepo().callItemDetailList(itemId);

    if (responseDTO.success) {}
  }
}

final BuyProvider = StateNotifierProvider.family
    .autoDispose<BuyViewModel, BuyModel?, int>((ref, itemId) {
  SessionData sessionData = ref.read(sessionProvider);
  return BuyViewModel(null, ref, sessionData)..notifyInit(itemId);
});
