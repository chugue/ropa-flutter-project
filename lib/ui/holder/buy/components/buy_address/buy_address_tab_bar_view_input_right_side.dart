import 'package:final_project_team02/ui/holder/buy/buy_viewmodel.dart';
import 'package:final_project_team02/ui/holder/buy/components/buy_address/buy_address_tab_bar_view_input_text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyAddressTabBarViewInputRightSide extends ConsumerWidget {
  BuyAddressTabBarViewInputRightSide({
    super.key,
    required GlobalKey<FormState> formkey,
  }) : _formkey = formkey;

  final GlobalKey<FormState> _formkey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BuyModel? model = ref.watch(buyProvider);

    return Expanded(
      flex: 2,
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuyAddressTabBarViewInputTextForm(
              controller: TextEditingController(
                text: ref.watch(
                  buyProvider.select((model) =>
                      model?.buy.isBaseAddress == true ? model?.buy.name : ''),
                ),
              ),
              onChanged: (value) =>
                  ref.read(buyProvider.notifier).updateName(value),
              text: "이름",
            ),
            SizedBox(height: 30),
            BuyAddressTabBarViewInputTextForm(
              controller: TextEditingController(
                text: ref.watch(
                  buyProvider.select((model) => model?.buy.isBaseAddress == true
                      ? model?.buy.address
                      : ''),
                ),
              ),
              onChanged: (value) =>
                  ref.read(buyProvider.notifier).updateAddress(value),
              text: "주소",
            ),
            SizedBox(height: 30),
            BuyAddressTabBarViewInputTextForm(
              controller: TextEditingController(
                text: ref.watch(
                  buyProvider.select((model) => model?.buy.isBaseAddress == true
                      ? model?.buy.detailAddress
                      : ''),
                ),
              ),
              onChanged: (value) =>
                  ref.read(buyProvider.notifier).updateDetailAddress(value),
              text: "상세주소",
            ),
            SizedBox(height: 45),
            BuyAddressTabBarViewInputTextForm(
              controller: TextEditingController(
                text: ref.watch(
                  buyProvider.select((model) =>
                      model?.buy.isBaseAddress == true ? model?.buy.phone : ''),
                ),
              ),
              onChanged: (value) =>
                  ref.read(buyProvider.notifier).updatePhone(value),
              text: "휴대번호",
            ),
            SizedBox(height: 15),
            BuyAddressTabBarViewInputTextForm(
              controller: TextEditingController(
                text: ref.watch(
                  buyProvider.select((model) =>
                      model?.buy.isBaseAddress == true ? model?.buy.email : ''),
                ),
              ),
              onChanged: (value) =>
                  ref.read(buyProvider.notifier).updateEmail(value),
              text: "이메일",
            ),
          ],
        ),
      ),
    );
  }
}
