
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/cart_repo.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_data/Cart.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_data/CartList.dart';
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
    this.totalCheckedPrice = 0,  // 초기값 설정
  });
}

class CartViewModel extends StateNotifier<CartModel?> {
  final mContext = navigatorKey.currentContext;

  CartViewModel(super.state);

  Future<void> removeItem(int itemId) async {


  }


  void toggleItem(int index) {
    if (state != null) {
      List<bool> newCheckedList = List.from(state!.isChecked);
      newCheckedList[index] = !newCheckedList[index];

      // 총 가격 재계산
      int newTotalCheckedPrice = 0;
      for (int i = 0; i < newCheckedList.length; i++) {
        if (newCheckedList[i]) {
          newTotalCheckedPrice += state!.cartList[i].itemPrice * state!.cartList[i].quantity;
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


  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await CartRepo().callCartList();
    if(responseDTO.success){
      CartModel model = responseDTO.response as CartModel;
      model.isChecked = List<bool>.filled(model.cartList.length, false); // 초기 체크 상태를 모두 false로 설정
      state = model;
    }
  }
}

//flutt
final cartProvider = StateNotifierProvider.family<CartViewModel, CartModel?,int>((ref,itemId) {
  return CartViewModel(null)..notifyInit();
});
