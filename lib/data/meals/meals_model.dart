import 'package:food_app/data/model_const.dart';

class MealResponse {
  List<MealData> meals;

  MealResponse.fromJsonMap(Map<String, dynamic> map):
    meals = map[ModelConst.MEALS] == null ? [] : List<MealData>.from(
      map[ModelConst.MEALS].map((it) => MealData.fromJsonMap(it)));

  Map<String, dynamic> toJson() => {ModelConst.MEALS: meals.map((e) => e.toJson()).toList()};
}

class MealData {
  String idMeal;
  String strMeal;
  String strMealThumb;

  MealData({this.idMeal, this.strMeal, this.strMealThumb});

  MealData.fromJsonMap(Map<String, dynamic> map):
    idMeal = map[ModelConst.ID_MEAL],
    strMeal = map[ModelConst.STR_MEAL],
    strMealThumb = map[ModelConst.STR_MEAL_THUMB];

  Map<String, dynamic> toJson() {
    return {
      ModelConst.ID_MEAL: idMeal,
      ModelConst.STR_MEAL: strMeal,
      ModelConst.STR_MEAL_THUMB: strMealThumb
    };
  }
}