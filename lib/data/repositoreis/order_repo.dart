import 'package:final_project_team02/_core/constants/http.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/order/order_data/item_history_list.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/order/order_history_viewmodel.dart';

class OrderRepo {
  Future<ResponseDTO> callOrderHistoryList() async {
    final response = await dio.get('/app/order-histories');
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      List<dynamic> items = responseDTO.response['itemHistoryDTOList'];
      List<ItemHistoryList> itemHistoryList =
          items.map((e) => ItemHistoryList.fromJson(e)).toList();

      logger.d("🚧🚧🚧🚧🚧🚧🚧 오더 아이템 리스트");

      responseDTO.response =
          OrderHistoryModel(itemHistoryList: itemHistoryList);
    }
    return responseDTO;
  }
}
