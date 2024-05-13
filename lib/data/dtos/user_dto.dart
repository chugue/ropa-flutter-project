class UserDTO {
  int? creatorId;
  bool blueChecked;
  String? photoName;
  String? base64;
  String nickName;
  String? height;
  String? weight;
  String? job;
  String? introMsg;

  UserDTO({
    this.creatorId,
    required this.blueChecked,
    this.photoName,
    this.base64,
    required this.nickName,
    this.height,
    this.weight,
    this.job,
    this.introMsg,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      creatorId: json["creatorId"],
      blueChecked: json["blueChecked"],
      photoName: json["photoName"],
      base64: json["base64"],
      nickName: json["nickName"],
      height: json["height"],
      weight: json["weight"],
      job: json["job"],
      introMsg: json["introMsg"],
    );
  }
}
