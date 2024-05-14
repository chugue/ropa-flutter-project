import 'package:final_project_team02/data/dtos/cart_req.dart';
import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/cart_repo.dart';
import 'package:final_project_team02/data/repositoreis/item_repo.dart';
import 'package:final_project_team02/data/session_data/session_data.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/item/item_data/detail_photos.dart';
import 'package:final_project_team02/ui/holder/item/item_data/item.dart';
import 'package:final_project_team02/ui/holder/item/item_data/main_photos.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_data/Cart.dart';
import 'package:final_project_team02/ui/holder/my_page/pages/cart/cart_data/CartList.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemDetailListModel {
  final Item item;
  final List<DetailPhotos> detailPhotos;
  final List<MainPhotos> mainPhotos;
  final int selecteItem;

  const ItemDetailListModel({
    this.selecteItem = 0,
    required this.item,
    required this.detailPhotos,
    required this.mainPhotos,
  });
}

class ItemDetailListViewModel extends StateNotifier<ItemDetailListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  SessionData sessionData;
  ItemDetailListViewModel(super.state, this.ref, this.sessionData);




  void updateSelection(int selecteItem) {
    if (state != null) {
      // Update the state with the new selection
      state = ItemDetailListModel(
        item: state!.item,
        detailPhotos: state!.detailPhotos,
        mainPhotos: state!.mainPhotos,
        selecteItem: selecteItem,
      );
    }
  }

  Future<void> notifyInit(int itemId) async {
    ResponseDTO responseDTO = await ItemRepo().callItemDetailList(itemId);

    if (responseDTO.success) {
      ItemDetailListModel itemDetailListModel = responseDTO.response;
      state = itemDetailListModel;
    }
  }
}

final itemDetailListProvider = StateNotifierProvider.family
    .autoDispose<ItemDetailListViewModel, ItemDetailListModel?, int>(
        (ref, itemId) {
  SessionData sessionData = ref.read(sessionProvider);

  return ItemDetailListViewModel(null, ref, sessionData)..notifyInit(itemId);
});
