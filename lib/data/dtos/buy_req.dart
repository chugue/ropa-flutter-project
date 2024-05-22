class BuySaveReqDTO {
  final String? name;
  final String? phone;
  final String? email;
  final String? postCode;
  final String? address;
  final String? detailAddress;
  final String? deliveryRequest;
  final int? selectedCodiId;
  final bool isBaseAddress;
  final PurchaseInfo? purchaseInfo;

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "phone": this.phone,
      "email": this.email,
      "postCode": this.postCode,
      "address": this.address,
      "detailAddress": this.detailAddress,
      "deliveryRequest": this.deliveryRequest,
      "selectedCodiId": this.selectedCodiId,
      "isBaseAddress": this.isBaseAddress,
      "purchaseInfo": this.purchaseInfo,
    };
  }

  const BuySaveReqDTO({
    this.name,
    this.phone,
    this.email,
    this.postCode,
    this.address,
    this.detailAddress,
    this.deliveryRequest,
    this.selectedCodiId,
    required this.isBaseAddress,
    this.purchaseInfo,
  });

  BuySaveReqDTO copyWith({
    String? name,
    String? phone,
    String? email,
    String? postCode,
    String? address,
    String? detailAddress,
    String? deliveryRequest,
    int? selectedCodiId,
    bool? isBaseAddress,
    PurchaseInfo? purchaseInfo,
  }) {
    return BuySaveReqDTO(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      postCode: postCode ?? this.postCode,
      address: address ?? this.address,
      detailAddress: detailAddress ?? this.detailAddress,
      deliveryRequest: deliveryRequest ?? this.deliveryRequest,
      selectedCodiId: selectedCodiId ?? this.selectedCodiId,
      isBaseAddress: isBaseAddress ?? this.isBaseAddress,
      purchaseInfo: purchaseInfo ?? this.purchaseInfo,
    );
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
