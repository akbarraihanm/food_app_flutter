import 'package:food_app/data/model_const.dart';

class CategoryResponse {
  List<CategoryData> categories;

  CategoryResponse.fromJsonMap(Map<String, dynamic> map):
    categories = map[ModelConst.CATEGORIES] == null ? [] : List<CategoryData>.from(
      map[ModelConst.CATEGORIES].map((it) => CategoryData.fromJsonMap(it)));

  Map<String, dynamic> toJson() => {ModelConst.CATEGORIES: categories.
  map((e) => e.toJson()).toList()};
}

class CategoryData {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  CategoryData.fromJsonMap(Map<String, dynamic> map):
    idCategory = map[ModelConst.ID_CATEGORY],
    strCategory = map[ModelConst.STR_CATEGORY],
    strCategoryThumb = map[ModelConst.STR_CATEGORY_THUMB],
    strCategoryDescription = map[ModelConst.STR_CATEGORY_DESCRIPTION];

  Map<String, dynamic> toJson() {
    return {
      ModelConst.ID_CATEGORY: idCategory,
      ModelConst.STR_CATEGORY: strCategory,
      ModelConst.STR_CATEGORY_THUMB: strCategoryThumb,
      ModelConst.STR_CATEGORY_DESCRIPTION: strCategoryDescription
    };
  }
}