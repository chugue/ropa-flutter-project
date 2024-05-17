import 'package:final_project_team02/data/dtos/respons_dto.dart';
import 'package:final_project_team02/data/repositoreis/inquiry.dart';
import 'package:final_project_team02/main.dart';
import 'package:final_project_team02/ui/holder/inquiry/inquiry_page/inquiries_list_data/inquiries_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InquiriesListModel {
  List<InquiriesList> inquiriesList;

  InquiriesListModel(this.inquiriesList);
}

class InquiriesListViewModel extends StateNotifier<InquiriesListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  InquiriesListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await InquiryRepo().callInquiriesList();

    if (responseDTO.success) {
      state = InquiriesListModel(responseDTO.response);
    }
  }
}

final inquiriesListProvider =
    StateNotifierProvider<InquiriesListViewModel, InquiriesListModel?>(
  (ref) {
    return InquiriesListViewModel(null, ref)..notifyInit();
  },
);
