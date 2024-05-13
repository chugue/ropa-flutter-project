import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/buy_req.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/buy.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/cart_infos.dart';
import 'package:final_project_team02/ui/holder/buy/buy_data/order_info.dart';
import 'package:final_project_team02/ui/holder/buy/buy_viewmodel.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class BuyRepo {
  Future<void> callBuySave(BuySaveReqDTO reqDTO) async {
    final response = await dio.post('/app/order',data: reqDTO.toJson());
  }



  Future<ResponseDTO> callBuyDetail() async {
    final response = await dio.get('/app/order-page');
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      Buy buy = Buy.fromJson(responseDTO.response);

      List<dynamic> carts = responseDTO.response['cartInfos'];

      List<CartInfos> cartInfos =
          carts.map((e) => CartInfos.fromJson(e)).toList();

      OrderInfo orderInfo =
          OrderInfo.fromJson(responseDTO.response['orderInfo']);

      BuyModel model =
          BuyModel(buy: buy, orderInfo: orderInfo, cartInfos: cartInfos);
      responseDTO.response = model;
    }
    return responseDTO;
  }
}
