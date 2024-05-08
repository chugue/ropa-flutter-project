class ResponseDTO {
  String errorMessage;
  bool success;
  dynamic response;

  ResponseDTO({
    required this.success,
    required this.errorMessage,
    required this.response,
  });

  factory ResponseDTO.fromJson(Map<String, dynamic> json) {
    return ResponseDTO(
        success: json["success"] ?? null,
        errorMessage: json["errorMessage"] ?? "",
        response: json["response"] ?? "");
  }
}
