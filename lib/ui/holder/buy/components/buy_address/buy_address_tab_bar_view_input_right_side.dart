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
    final TextEditingController _name =
        TextEditingController(text: model!.buy.name);
    final TextEditingController _phone =
        TextEditingController(text: model.buy.phone);
    final TextEditingController _address =
        TextEditingController(text: model.buy.address);
    final TextEditingController _detailAddress =
        TextEditingController(text: model.buy.detailAddress);
    final TextEditingController _email =
        TextEditingController(text: model.buy.email);

    ref.read(buyProvider.notifier).updateBuyDetails(address: _address.text.trim(), phone: _phone.text.trim(), detailAddress: _detailAddress.text.trim(),
    )
    return Expanded(
      flex: 2,
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuyAddressTabBarViewInputTextForm(controller: _name, text: "이름"),
            SizedBox(height: 30),
            // BuyAddressTabBarViewInputAddressSearch(),
            SizedBox(height: 0),
            BuyAddressTabBarViewInputTextForm(controller: _address, text: "주소"),
            SizedBox(height: 30),
            BuyAddressTabBarViewInputTextForm(
                controller: _detailAddress, text: "상세주소"),
            SizedBox(height: 45),
            BuyAddressTabBarViewInputTextForm(controller: _phone, text: "휴대번호"),
            // BuyAddressTabBarViewInputPhoneNumber(),
            SizedBox(height: 15),
            BuyAddressTabBarViewInputTextForm(controller: _email, text: "이메일"),
            // BuyAddressTabBarViewInputEmail(),
          ],
        ),
      ),
    );
  }
}
