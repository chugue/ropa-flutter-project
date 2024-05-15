class ResponseDTO {
  int status;
  bool success;
  dynamic response;
  String? errorMessage;

  ResponseDTO({
    required this.success,
    required this.status,
    this.response,
    this.errorMessage,
  });

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : success = json["success"],
        status = json["status"],
        response = json["response"] ?? "",
        errorMessage = json["errorMessage"] ?? "";
}
