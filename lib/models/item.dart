class Item {
  int id;
  String mainImg;
  String brandImg;
  String brandName;
  String itemDetailImg;

  Item({
    required this.id,
    required this.mainImg,
    required this.brandImg,
    required this.brandName,
    required this.itemDetailImg,
  });
}

List<Item> itemList = [
  Item(
    id: 1,
    mainImg: "assets/images/item/item_01.png",
    brandImg: "assets/images/ropa_logo.png",
    brandName: "ROPA",
    itemDetailImg:
        "https://static.lookpin.co.kr/20230621151259-7b87/8e57f39c698bb2efca1b7afce03c0fa7.jpg",
  )
];
