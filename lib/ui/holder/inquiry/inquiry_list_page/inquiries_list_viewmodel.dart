import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/inquiries_repo.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_list_page/inquiries_data/inquiries_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InquiriesListModel {
  final List<InquiriesList> inquiriesList;

  InquiriesListModel(this.inquiriesList);
}

class InquiriesListViewModel extends StateNotifier<InquiriesListModel?> {
  InquiriesListViewModel(super.state);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await InquiriesRepo().callInquiriesList();

    if (responseDTO.success) {
      InquiriesListModel inquiriesListModel = responseDTO.response;

      state = inquiriesListModel;
    }
  }
}

//flutt
final inquiriesListProvider =
    StateNotifierProvider<InquiriesListViewModel, InquiriesListModel?>((ref) {
  return InquiriesListViewModel(null)..notifyInit();
});
