class InquiryItem {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;

  final String state;

  final String answer;
  final DateTime answerCreatedAt;

  InquiryItem({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.state,
    required this.answer,
    required this.answerCreatedAt, // null 값을 위해 초기화 값을 null로
  });
}

List<InquiryItem> inquiryList = [
  InquiryItem(
    id: 1,
    title: "옷 사이즈 질문드립니다.",
    content: "총 기장과 가슴 폭좀 알려주세요",
    createdAt: DateTime(2024, 3, 22, 15, 30),
    state: "답변 대기",
    answer: "null",
    answerCreatedAt: DateTime(0),
  ),
  InquiryItem(
    id: 2,
    title: "혀가 거짓말을 하면?",
    content: "전혀 아니에요..",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 아직",
    answer: "null",
    answerCreatedAt: DateTime(0),
  ),
  InquiryItem(
    id: 3,
    title: "스님이 공중부양 하면?",
    content: "어중이 떠중이",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 대기",
    answer: "푸하하하하하",
    answerCreatedAt: DateTime(2024, 5, 04, 11, 30),
  ),
  InquiryItem(
    id: 4,
    title: "여자 : 좋은 소식과 나쁜 소식이 있어. 우리 헤어지자.",
    content: "남자 : 그럼 나쁜 소식은?",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 완료",
    answer: "푸하하하하하",
    answerCreatedAt: DateTime(2024, 5, 04, 12, 45),
  ),
  InquiryItem(
    id: 5,
    title: "문의 제목 5",
    content: "문의 내용 5문의 내용 5문의 내용 5문의 내용 5문의 내용 5문의 내용 5문의 내용 5문의 내용 5",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 완료",
    answer: "푸하하하하하",
    answerCreatedAt: DateTime(2024, 5, 04, 13, 55),
  ),
  InquiryItem(
    id: 6,
    title: "문의 제목 6",
    content: "문의 내용 6",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 완료",
    answer: "답변 5",
    answerCreatedAt: DateTime(2024, 5, 04, 14, 30),
  ),
  InquiryItem(
    id: 7,
    title: "문의 제목 7",
    content: "문의 내용 7",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 완료",
    answer: "답변 7",
    answerCreatedAt: DateTime(2024, 5, 04, 15, 20),
  ),
  InquiryItem(
    id: 8,
    title: "문의 제목 8",
    content: "문의 내용 8",
    createdAt: DateTime(2024, 5, 03, 14, 40),
    state: "답변 완료",
    answer: "답변 8",
    answerCreatedAt: DateTime(2024, 5, 04, 16, 10),
  ),
];
