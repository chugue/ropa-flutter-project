import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/cart_req.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_data/Cart.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_data/CartList.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_viewmodel.dart';

class CartRepo {
  Future<ResponseDTO> callCartSave(CartSaveDTO reqDTO) async {
    final response = await dio.post('/app/carts/save', data: reqDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    //입력된 로우를 리스트에 상태변경
    if (responseDTO.success) {
      responseDTO.response = CartList.fromJson(responseDTO.response);
    }
    return responseDTO;
  }

  Future<ResponseDTO> callCartList() async {
    final response = await dio.get('/app/carts');
    // logger.d(response.data);
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    // logger.d(responseDTO.response);

    if (responseDTO.success) {
      Cart cart = Cart.fromJson(responseDTO.response);
      // logger.d(cart.toString());

      List<dynamic> carts = responseDTO.response['cartList'];
      List<CartList> cartList =
          carts.map((cart) => CartList.fromJson(cart)).toList();
      // logger.d(cartList.length);

      List<bool> isChecked = List<bool>.filled(cartList.length, false);

      CartModel model = CartModel(
        isChecked: isChecked,
        cart: cart,
        cartList: cartList,
      );

      responseDTO.response = model;
    }
    return responseDTO;
  }

  Future<ResponseDTO> removeItem(int cartId) async {
    print('🚧🚧🚧🚧🚧🚧');
    print(cartId);
    print(cartId);
    print(cartId);
    final response = await dio.delete('/app/carts/${cartId}');
    logger.d(response.data!);
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    return responseDTO;
  }
}
