class CategoriesModel {
  String? categoryID;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;
  String? categoryDateTime;

  CategoriesModel({
    required this.categoryID,
    required this.categoryName,
    required this.categoryNameAr,
    required this.categoryImage,
    required this.categoryDateTime,
  });

  CategoriesModel.fromJson(Map jsonData) {
    categoryID = jsonData['categoryID'];
    categoryName = jsonData['categoryName'];
    categoryNameAr = jsonData['categoryNameAr'];
    categoryImage = jsonData['categoryImage'];
    categoryDateTime = jsonData['categoryDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['categoryID'] = categoryID;
    data['categoryName'] = categoryName;
    data['categoryNameAr'] = categoryNameAr;
    data['categoryImage'] = categoryImage;
    data['categoryDateTime'] = categoryDateTime;

    return data;
  }
}
