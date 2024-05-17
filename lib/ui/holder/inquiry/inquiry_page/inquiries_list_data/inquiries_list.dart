class InquiriesList {
  final int inquiryId;
  final bool isReplied;
  final String title;
  final String content;
  final String createdAt;

  InquiriesList({
    required this.inquiryId,
    required this.isReplied,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory InquiriesList.fromJson(Map<String, dynamic> json) {
    return InquiriesList(
      inquiryId: json["inquiryId"],
      isReplied: json["isReplied"],
      title: json["title"],
      content: json["content"],
      createdAt: json["createdAt"],
    );
  }
}
