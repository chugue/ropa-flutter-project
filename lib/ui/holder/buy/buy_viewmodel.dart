import 'package:final_project_team02/_core/constants/move.dart';
import 'package:final_project_team02/data/dtos/buy_req.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/buy_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/buy.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/cart_infos.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/order_info.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyModel {
  final Buy buy;
  final List<CartInfos> cartInfos;
  final OrderInfo orderInfo;
  int? orderBuy;
  int? selectedOptionId;
  int? selectedCodiId;

  BuyModel({
    required this.buy,
    required this.cartInfos,
    required this.orderInfo,
    this.orderBuy = 0,
    this.selectedOptionId = 0,
    this.selectedCodiId = 0,
  });

  BuyModel copyWith({
    Buy? buy,
    List<CartInfos>? cartInfos,
    OrderInfo? orderInfo,
    int? orderBuy,
    int? selectedOptionId,
    int? selectedCodiId,
  }) {
    return BuyModel(
      buy: buy ?? this.buy,
      cartInfos: cartInfos ?? this.cartInfos,
      orderInfo: orderInfo ?? this.orderInfo,
      orderBuy: orderBuy ?? this.orderBuy,
      selectedOptionId: selectedOptionId ?? this.selectedOptionId,
      selectedCodiId: selectedCodiId ?? this.selectedCodiId,
    );
  }
}

class BuyViewModel extends StateNotifier<BuyModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  SessionData sessionData;

  BuyViewModel(super.state, this.ref, this.sessionData);

  Future<ResponseDTO> buySave() async {
    BuyModel model = state!;

    PurchaseInfo purchaseInfo = PurchaseInfo(
      orderAmount: model.orderInfo.orderAmount,
      deliveryType: 'FREE',
      deliveryFee: model.orderInfo.deliveryFee,
      discount: model.orderInfo.discount,
      purchaseAmount: model.orderInfo.purchaseAmount,
      payMethod: model.orderInfo.payMethod,
      savedPayMethod: model.orderInfo.savedPayMethod,
    );

    BuySaveReqDTO reqDTO = BuySaveReqDTO(
      selectedCodiId: model.selectedCodiId!,
      name: model.buy.name,
      phone: model.buy.phone,
      email: model.buy.email,
      address: model.buy.address,
      isBaseAddress: model.buy.isBaseAddress,
      deliveryRequest: model.buy.deliveryRequest,
      detailAddress: model.buy.detailAddress,
      purchaseInfo: purchaseInfo,
      postCode: "12345",
    );

    ResponseDTO responseDTO = await BuyRepo().callBuySave(reqDTO);

    if (responseDTO.success) {
      ref.read(cartProvider.notifier).removeSelectedItems();
      Navigator.pushNamedAndRemoveUntil(
          mContext!, Move.mainHolder, (route) => false);
    }

    return responseDTO;
  }

  int newSelectedOptionId = 0;
  String newPayMethod = '';

  void selectPayment(int paymentId, String payMethod) {
    newSelectedOptionId = paymentId;
    newPayMethod = payMethod;
    state = state!.copyWith(
      selectedOptionId: newSelectedOptionId,
      orderInfo: state!.orderInfo.copyWith(payMethod: newPayMethod),
    );
  }

// 사용자 입력을 업데이트하는 메서드
  void orderBuy() {
    int newOrderBuy = 0;
    for (int i = 0; i < state!.cartInfos.length; i++) {
      newOrderBuy += state!.cartInfos[i].price;
    }
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
      state = state!.copyWith(buy: state!.buy.copyWith(name: name));
    }
  }

  void updatePhone(String phone) {
    if (state != null) {
      state = state!.copyWith(buy: state!.buy.copyWith(phone: phone));
    }
  }

  void updateAddress(String address) {
    if (state != null) {
      state = state!.copyWith(buy: state!.buy.copyWith(address: address));
    }
  }

  void updateDetailAddress(String detailAddress) {
    if (state != null) {
      state = state!.copyWith(buy: state!.buy.copyWith(detailAddress: detailAddress));
    }
  }

  void updateEmail(String email) {
    if (state != null) {
      state = state!.copyWith(buy: state!.buy.copyWith(email: email));
    }
  }

  void selectedCodiId(int codiId) {
    if (state != null) {
      state = state!.copyWith(selectedCodiId: codiId);
    }
  }


}

final buyProvider = StateNotifierProvider<BuyViewModel, BuyModel?>((ref) {
  SessionData sessionData = ref.read(sessionProvider);
  return BuyViewModel(null, ref, sessionData)..notifyInit();
});
