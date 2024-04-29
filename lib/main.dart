import 'package:final_project_team02/holder/buy/buy_page.dart';
import 'package:final_project_team02/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_info.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';
import '_core/constants/theme.dart';
import 'holder/main_holder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MainHolder(),

    );
  }
}

// "PaymentWidgetFlutterSDK" using [{"name":"changePaymentMethod","params":{"type":"NORMAL","method":"간편결제","easyPay":{"provider":"토스페이"}}}]
class PaymentWidgetExamplePage extends StatefulWidget {
  const PaymentWidgetExamplePage({super.key});

  @override
  State<PaymentWidgetExamplePage> createState() {
    return _PaymentWidgetExamplePageState();
  }
}

class _PaymentWidgetExamplePageState extends State<PaymentWidgetExamplePage> {
  late PaymentWidget _paymentWidget;
  PaymentMethodWidgetControl? _paymentMethodWidgetControl;
  AgreementWidgetControl? _agreementWidgetControl;

  @override
  void initState() {
    super.initState();

    _paymentWidget = PaymentWidget(
      clientKey: "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm",
      customerKey: "TTxJJENdiV7lDUP6W9m9W",
      // 결제위젯에 브랜드페이 추가하기
      // paymentWidgetOptions: PaymentWidgetOptions(brandPayOption: BrandPayOption("리다이렉트 URL")) // Access Token 발급에 사용되는 리다이렉트 URL
    );

    _paymentWidget
        .renderPaymentMethods(
            selector: 'methods', //간편결제
            amount: Amount(value: 300, currency: Currency.KRW, country: "KR"),
            options: RenderPaymentMethodsOptions(variantKey: "DEFAULT"))
        .then((control) {
      _paymentMethodWidgetControl = control;
    });

    _paymentWidget.renderAgreement(selector: 'agreement').then((control) {
      _agreementWidgetControl = control;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Expanded(
          child: ListView(children: [
        PaymentMethodWidget(
          paymentWidget: _paymentWidget,
          selector: 'methods',
        ),
        AgreementWidget(paymentWidget: _paymentWidget, selector: 'agreement'),
        ElevatedButton(
            onPressed: () async {
              final paymentResult = await _paymentWidget.requestPayment(
                  paymentInfo: const PaymentInfo(
                      orderId: 'LRoOVFbxDJOvvzFjkrB0V',
                      orderName: '토스 티셔츠 외 2건'));
              if (paymentResult.success != null) {
                // 결제 성공 처리
              } else if (paymentResult.fail != null) {
                // 결제 실패 처리
              }
            },
            child: const Text('결제하기')),
        ElevatedButton(
            onPressed: () async {
              final selectedPaymentMethod =
                  await _paymentMethodWidgetControl?.getSelectedPaymentMethod();
              print(
                  '${selectedPaymentMethod?.method} ${selectedPaymentMethod?.easyPay?.provider ?? ''}');
            },
            child: const Text('선택한 결제수단 출력')),
        ElevatedButton(
            onPressed: () async {
              final agreementStatus =
                  await _agreementWidgetControl?.getAgreementStatus();
              print('${agreementStatus?.agreedRequiredTerms}');
            },
            child: const Text('약관 동의 상태 출력')),
        ElevatedButton(
            onPressed: () async {
              await _paymentMethodWidgetControl?.updateAmount(amount: 300);
              print('결제 금액이 300원으로 변경되었습니다.');
            },
            child: const Text('결제 금액 변경'))
      ]))
    ])));
  }
}
