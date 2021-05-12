import 'package:food_app/data/model_const.dart';

class DetailMealResponse {
  List<DetailMealData> meals;

  DetailMealResponse.fromJsonMap(Map<String, dynamic> map):
    meals = map[ModelConst.MEALS] == null ? [] : List<DetailMealData>.from(
      map[ModelConst.MEALS].map((it) => DetailMealData.fromJsonMap(it)));

  Map<String, dynamic> toJson() => {ModelConst.MEALS: meals.map((e) => e.toJson()).toList()};
}

class DetailMealData {
  String idMeal;
  String strMeal;
  String strCategory;
  String strInstructions;
  String strMealThumb;
  String strYoutube;
  String strSource;

  DetailMealData.fromJsonMap(Map<String, dynamic> map):
    idMeal = map[ModelConst.ID_MEAL],
    strMeal = map[ModelConst.STR_MEAL],
    strCategory = map[ModelConst.STR_CATEGORY],
    strInstructions = map[ModelConst.STR_INSTRUCTIONS],
    strMealThumb = map[ModelConst.STR_MEAL_THUMB],
    strYoutube = map[ModelConst.STR_YOUTUBE],
    strSource = map[ModelConst.STR_SOURCE];

  Map<String, dynamic> toJson() {
    return {
      ModelConst.ID_MEAL: idMeal,
      ModelConst.STR_MEAL: strMeal,
      ModelConst.STR_CATEGORY: strCategory,
      ModelConst.STR_INSTRUCTIONS: strInstructions,
      ModelConst.STR_MEAL_THUMB: strMealThumb,
      ModelConst.STR_YOUTUBE: strYoutube,
      ModelConst.STR_SOURCE: strSource
    };
  }
}