class InquiryItem {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;

  final String state;

  InquiryItem(
      {required this.id,
      required this.title,
      required this.content,
      required this.createdAt,
      required this.state});
}

List<InquiryItem> inquiryList = [
  InquiryItem(
    id: 1,
    title: "옷 사이즈 질문드립니다.",
    content: "총 기장과 가슴 폭좀 알려주세요",
    createdAt: DateTime(2024, 3, 22, 15, 30),
    state: "답변 대기",
  ),
  InquiryItem(
    id: 2,
    title: "혀가 거짓말을 하면?",
    content: "전혀 아니에요..",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 아직",
  ),
  InquiryItem(
    id: 3,
    title: "스님이 공중부양 하면?",
    content: "어중이 떠중이",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 대기",
  ),
  InquiryItem(
    id: 4,
    title: "여자 : 좋은 소식과 나쁜 소식이 있어. 우리 헤어지자.",
    content: "남자 : 그럼 나쁜 소식은?",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 완료",
  ),
  InquiryItem(
    id: 5,
    title: "문의 제목 5",
    content: "문의 내용 5문의 내용 5문의 내용 5문의 내용 5문의 내용 5문의 내용 5문의 내용 5문의 내용 5",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 완료",
  ),
  InquiryItem(
    id: 5,
    title: "문의 제목 5",
    content: "문의 내용 5",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 완료",
  ),
  InquiryItem(
    id: 5,
    title: "문의 제목 5",
    content: "문의 내용 5",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 완료",
  ),
  InquiryItem(
    id: 5,
    title: "문의 제목 5",
    content: "문의 내용 5",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 완료",
  ),
  InquiryItem(
    id: 5,
    title: "문의 제목 5",
    content: "문의 내용 5",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 완료",
  )
];
