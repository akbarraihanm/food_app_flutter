import 'package:food_app/data/categories/categories_model.dart';
import 'package:food_app/data/meals/detail_meal_model.dart';
import 'package:food_app/data/meals/meals_model.dart';
import 'package:food_app/domain/network/http_helper.dart';
import 'package:food_app/domain/network/url_helper.dart';

class ApiRepository extends HttpHelper {
  ApiRepository._privateConstructor();
  static final ApiRepository _instance = ApiRepository._privateConstructor();
  static ApiRepository get instance {
    return _instance;
  }

  //====================== List your API requests here =====================//

  Future<List<CategoryData>> getCategories() async {
    final response = await this.getMethod(URLHelper.getCategories);
    return CategoryResponse.fromJsonMap(response).categories;
  }

  Future<List<MealData>> getMeals({String category}) async {
    final response = await this.getMethod("${URLHelper.getMeals}?c=$category");
    return MealResponse.fromJsonMap(response).meals;
  }

  Future<DetailMealData> getDetailMeal({String id}) async {
    final response = await this.getMethod("${URLHelper.getDetailMeal}?i=$id");
    return DetailMealResponse.fromJsonMap(response).meals.first;
  }
}