import 'package:final_project_team02/data/dtos/cart_req.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/cart_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/buy/buy_page.dart';
import 'package:final_project_team02/ui/holder/item/components/item_cart_dialog.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_data/Cart.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_data/CartList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartModel {
  final Cart cart;
  final List<CartList> cartList;
  List<bool> isChecked;
  int totalCheckedPrice; // 체크된 상품들의 총 가격

  CartModel({
    required this.cart,
    required this.cartList,
    required this.isChecked,
    this.totalCheckedPrice = 0, // 초기값 설정
  });
}

class CartViewModel extends StateNotifier<CartModel?> {
  final mContext = navigatorKey.currentContext;

  CartViewModel(super.state, SessionData sessionData);

  void removeSelectedItems() async {
    if (state != null) {
      List<int> selectedIds = [];
      for (int i = 0; i < state!.isChecked.length; i++) {
        if (state!.isChecked[i]) {
          selectedIds.add(state!.cartList[i].cartId);
        }
      }

      for (int id in selectedIds) {
        print("${selectedIds}");
        await removeItem(id);
      }
    }
  }

  void deleteCart(int cartId) {
    CartModel model = state!;
    List<CartList> prevCarts = model.cartList;

    List<CartList> newCartList =
        prevCarts.where((p) => p.cartId != cartId).toList();

    state = CartModel(
        cart: state!.cart,
        cartList: newCartList,
        isChecked: state!.isChecked,
        totalCheckedPrice: state!.totalCheckedPrice);
  }

  //장바구니에서 buyPage로 갈떄 선택된 항목만 가져간다.
  void goToBuyPage(CartModel model) {
    List<int> checkedItemIds = [];
    for (int i = 0; i < model.cartList.length; i++) {
      if (model.isChecked[i]) {
        checkedItemIds.add(model.cartList[i].itemId);
      }
    }

    if (checkedItemIds.isNotEmpty) {
      Navigator.push(
        mContext!,
        MaterialPageRoute(
          builder: (context) => BuyPage(itemIds: checkedItemIds),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("선택된 항목이 없습니다!")));
    }
  }

  Future<void> cartSave(CartSaveDTO reqDTO) async {
    ResponseDTO responseDTO = await CartRepo().callCartSave(reqDTO);

    if (responseDTO.success) {
      showDialog(
        context: mContext!,
        builder: (context) {
          return ItemCartDialog();
        },
      );

      Cart cart = state!.cart;
      CartList carts = responseDTO.response;
      List<CartList> prevCartList = state!.cartList;
      List<CartList> newCartList = [carts, ...prevCartList];

      List<bool> isChecked = List<bool>.filled(newCartList.length, false);

      state = CartModel(
          cart: cart,
          cartList: newCartList,
          isChecked: isChecked,
          totalCheckedPrice: state!.totalCheckedPrice);
    }
  }

  Future<ResponseDTO> removeItem(int cartId) async {
    ResponseDTO responseDTO = await CartRepo().removeItem(cartId);

    if (responseDTO.success) {
      if (state != null) {
        List<CartList> prevCartList = state!.cartList;

        List<CartList> updatedCartList =
            prevCartList.where((p) => p.cartId != cartId).toList();

        // 총 가격 재계산
        int newTotalCheckedPrice = 0;

        List<bool> newIsChecked =
            List<bool>.filled(updatedCartList.length, false);

        for (int i = 0; i < updatedCartList.length; i++) {
          if (state!.isChecked[i] && updatedCartList[i].cartId == cartId) {
            newTotalCheckedPrice +=
                updatedCartList[i].itemPrice * updatedCartList[i].quantity;
            newIsChecked[i] = state!.isChecked[i];
          }
        }

        // 체크된 아이템만을 고려한 전체 카트 가격 재계산
        int newTotalCartPrice = 0;

        for (int i = 0; i < updatedCartList.length; i++) {
          if (newIsChecked[i]) {
            newTotalCartPrice +=
                updatedCartList[i].itemPrice * updatedCartList[i].quantity;
          }
        }
        // 상태 업데이트
        state = CartModel(
          cart: state!.cart,
          cartList: updatedCartList,
          isChecked: state!.isChecked,
          totalCheckedPrice: newTotalCartPrice,
        );
      }
    }
    return responseDTO;
  }

  void toggleItem(int index) {
    if (state != null) {
      List<bool> newCheckedList = List.from(state!.isChecked);
      newCheckedList[index] = !newCheckedList[index];

      // 총 가격 재계산
      int newTotalCheckedPrice = 0;
      for (int i = 0; i < newCheckedList.length; i++) {
        if (newCheckedList[i]) {
          newTotalCheckedPrice +=
              state!.cartList[i].itemPrice * state!.cartList[i].quantity;
        }
      }

      state = CartModel(
        cart: state!.cart,
        cartList: state!.cartList,
        isChecked: newCheckedList,
        totalCheckedPrice: newTotalCheckedPrice,
      );
    }
  }

  Future<void> notifyInit(SessionData sessionData) async {
    ResponseDTO responseDTO = await CartRepo().callCartList();

    if (responseDTO.success) {
      CartModel model = responseDTO.response;
      model.isChecked = List<bool>.filled(model.cartList.length, false);
      state = model;
    }
  }
}

//flutt
final cartProvider = StateNotifierProvider<CartViewModel, CartModel?>((ref) {
  SessionData sessionData = SessionData();
  return CartViewModel(null, sessionData)..notifyInit(sessionData);
});
