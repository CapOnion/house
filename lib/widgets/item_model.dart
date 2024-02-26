class ItemModel {
late String itemName;
late String itemPrice;
late String itemImage;
late String itemGroup;
late String itemSex;
late bool isFavorite;
ItemModel({
  required this.itemName,
  required this.itemGroup,
  required this.itemPrice,
  required this.itemImage,
  required this.itemSex,
  required this.isFavorite,
});
Map<String, dynamic> toMap() {
  {
    return {
      'itemName': itemName,
      'itemPrice': itemPrice,
      'itemGroup': itemGroup,
      'itemImage': itemImage,
      'itemSex' : itemSex,
      'isFavorite': isFavorite,
    };
  }
}

ItemModel.fromMap(Map<String, dynamic> map) {
itemPrice = map['itemPrice'];
itemGroup = map['itemGroup'];
itemName = map['itemName'];
itemImage = map['itemImage'];
itemSex = map['itemSex'];
isFavorite = map['isFavorite'];
}
}