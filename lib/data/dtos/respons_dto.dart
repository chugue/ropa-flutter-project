class ResponseDTO {
  int status;
  bool success;
  String errorMessage;
  dynamic response;

  ResponseDTO({
    required this.success,
    required this.status,
    required this.errorMessage,
    required this.response,
  });

  factory ResponseDTO.fromJson(Map<String, dynamic> json) {
    return ResponseDTO(
        success: json["success"] ?? null,
        status: json["status"],
        errorMessage: json["errorMessage"] ?? "",
        response: json["response"] ?? "");
  }
//
}
