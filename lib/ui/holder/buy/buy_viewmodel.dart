import 'package:final_project_team02/data/dtos/buy_req.dart';
import 'package:final_project_team02/data/dtos/buy_req.dart';
import 'package:final_project_team02/data/dtos/buy_req.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/buy_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/buy.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/cart_infos.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/option.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/order_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyModel {
  final Buy buy;
  final List<CartInfos> cartInfos;
  final OrderInfo orderInfo;
  int? orderBuy;
  int? selectedOptionId;

  BuyModel({
    required this.buy,
    required this.cartInfos,
    required this.orderInfo,
    this.orderBuy = 0,
    this.selectedOptionId = 0,
  });
}

class BuyViewModel extends StateNotifier<BuyModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  SessionData sessionData;

  BuyViewModel(super.state, this.ref, this.sessionData);

  Future<ResponseDTO> buySave(BuySaveReqDTO reqDTO) async {
    ResponseDTO responseDTO = await BuyRepo().callBuySave(reqDTO);
    return responseDTO;
  }

  int newSelectedOptionId = 0;

  void selectPayment(int paymentId) {
    newSelectedOptionId = paymentId;
    state = BuyModel(
      buy: state!.buy,
      cartInfos: state!.cartInfos,
      orderInfo: state!.orderInfo,
      orderBuy: state!.orderBuy,
      selectedOptionId: newSelectedOptionId,
    );
  }

// 사용자 입력을 업데이트하는 메서드
  void updateBuyDetails({
    required String name,
    required String phone,
    required String address,
    required String detailAddress,
    required String email,
  }) {
    if (state != null) {
      state = BuyModel(
        buy: Buy(
            name: name,
            phone: phone,
            address: address,
            detailAddress: detailAddress,
            email: email,
            orderId: state!.buy.orderId,
            deliveryRequest: state!.buy.deliveryRequest,
            isBaseAddress: state!.buy.isBaseAddress),
        cartInfos: state!.cartInfos,
        orderInfo: state!.orderInfo,
        orderBuy: state!.orderBuy,
      );
    }
  }

  void orderBuy() {
    int newOrderBuy = 0;
    for (int i = 0; i < state!.cartInfos.length; i++) {
      newOrderBuy += state!.cartInfos[i].price;
    }
    print("🚧🚧🚧🚧🚧🚧🚧🚧${newOrderBuy}");

    state!.orderBuy = newOrderBuy; // copyWith 사용 또는 다른 방식으로 state 업데이트
  }

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await BuyRepo().callBuyDetail();
    if (responseDTO.success && responseDTO.response is BuyModel) {
      BuyModel model = responseDTO.response;
      state = model;
      orderBuy(); // 초기화 후 주문 총액 계산
    }
  }

  void updateName(String name) {
    if (state != null) {
      state = BuyModel(
        buy: state!.buy.copyWith(name: name),
        cartInfos: state!.cartInfos,
        orderInfo: state!.orderInfo,
        orderBuy: state!.orderBuy,
      );
    }
  }

  void updatePhone(String phone) {
    if (state != null) {
      state = BuyModel(
        buy: state!.buy.copyWith(phone: phone),
        cartInfos: state!.cartInfos,
        orderInfo: state!.orderInfo,
        orderBuy: state!.orderBuy,
      );
    }
  }

  void updateAddress(String address) {
    if (state != null) {
      state = BuyModel(
        buy: state!.buy.copyWith(address: address),
        cartInfos: state!.cartInfos,
        orderInfo: state!.orderInfo,
        orderBuy: state!.orderBuy,
      );
    }
  }

  void updateDetailAddress(String detailAddress) {
    if (state != null) {
      state = BuyModel(
        buy: state!.buy.copyWith(detailAddress: detailAddress),
        cartInfos: state!.cartInfos,
        orderInfo: state!.orderInfo,
        orderBuy: state!.orderBuy,
      );
    }
  }

  void updateEmail(String email) {
    if (state != null) {
      state = BuyModel(
        buy: state!.buy.copyWith(email: email),
        cartInfos: state!.cartInfos,
        orderInfo: state!.orderInfo,
        orderBuy: state!.orderBuy,
      );
    }
  }
}

final buyProvider = StateNotifierProvider<BuyViewModel, BuyModel?>((ref) {
  SessionData sessionData = ref.read(sessionProvider);
  return BuyViewModel(null, ref, sessionData)..notifyInit();
});
