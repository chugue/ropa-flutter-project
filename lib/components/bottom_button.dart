import 'package:flutter/material.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_info.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';

class BottomButton extends StatefulWidget {
  String text;

  BottomButton({
    required this.text,
  });

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  late PaymentWidget _paymentWidget;
  PaymentMethodWidgetControl? _paymentMethodWidgetControl;

  @override
  void initState() {
    super.initState();

    _paymentWidget = PaymentWidget(
      clientKey: "test_ck_P9BRQmyarYPADYGBnM1ZVJ07KzLN",
      customerKey: "uCzZaLkI2__Mgtogi2w0u",
      // 결제위젯에 브랜드페이 추가하기
      // paymentWidgetOptions: PaymentWidgetOptions(brandPayOption: BrandPayOption("리다이렉트 URL")) // Access Token 발급에 사용되는 리다이렉트 URL
    );

    _paymentWidget
        .renderPaymentMethods(
            selector: '간편결제', //간편결제
            amount: Amount(value: 300, currency: Currency.KRW, country: "KR"),
            options: RenderPaymentMethodsOptions(variantKey: "DEFAULT"))
        .then((control) {
      _paymentMethodWidgetControl = control;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          final paymentResult = await _paymentWidget.requestPayment(
              paymentInfo: const PaymentInfo(
                  orderId: 'LRoOVFbxDJOvvzFjkrB0V', orderName: '토스 티셔츠 외 2건'));
          if (paymentResult.success != null) {
            // 결제 성공 처리
          } else if (paymentResult.fail != null) {
            // 결제 실패 처리
          }
        },
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          padding: EdgeInsets.symmetric(vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
