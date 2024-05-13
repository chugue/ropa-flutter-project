class BuySaveReqDTO {
  final String? name;
  final String? phone;
  final String? email;
  final String? postCode;
  final String? address;
  final String? detailAddress;
  final String? deliveryRequest;
  final bool isBaseAddress;
  final PurchaseInfo? purchaseInfo;

  const BuySaveReqDTO({
    required this.name,
    required this.phone,
    required this.email,
    required this.postCode,
    required this.address,
    required this.detailAddress,
    required this.deliveryRequest,
    required this.isBaseAddress,
    required this.purchaseInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "phone": this.phone,
      "email": this.email,
      "postCode": this.postCode,
      "address": this.address,
      "detailAddress": this.detailAddress,
      "deliveryRequest": this.deliveryRequest,
      "isBaseAddress": this.isBaseAddress,
      "purchaseInfo": this.purchaseInfo,
    };
  }
}

class PurchaseInfo {
  final int? orderAmount;
  final int? deliveryFee;
  final int? discount;
  final int? purchaseAmount;
  final String? deliveryType;
  final String? payMethod;
  final bool? savedPayMethod;

  const PurchaseInfo({
    required this.orderAmount,
    required this.deliveryFee,
    required this.discount,
    required this.purchaseAmount,
    required this.deliveryType,
    required this.payMethod,
    required this.savedPayMethod,
  });

  Map<String, dynamic> toJson() {
    return {
      "orderAmount": this.orderAmount,
      "deliveryFee": this.deliveryFee,
      "discount": this.discount,
      "purchaseAmount": this.purchaseAmount,
      "deliveryType": this.deliveryType,
      "payMethod": this.payMethod,
      "savedPayMethod": this.savedPayMethod,
    };
  }
}
