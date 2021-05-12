class URLHelper {
  static const String baseUrl = "https://www.themealdb.com/api/json/v1/1";

  static const String getCategories = "$baseUrl/categories.php";
  static const String getMeals = "$baseUrl/filter.php";
  static const String getDetailMeal = "$baseUrl/lookup.php";
}