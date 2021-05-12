import 'package:food_app/data/categories/categories_model.dart';
import 'package:food_app/domain/database/database.dart';

abstract class HomeState {}

class InitHomeState extends HomeState {}

class ShowLoadingHomeState extends HomeState {}

class ShowCategoriesDataHomeState extends HomeState {
  List<CategoryData> list;

  ShowCategoriesDataHomeState({this.list});
}

class ShowFavoriteFoodState extends HomeState {
  List<Food> list;

  ShowFavoriteFoodState({this.list});
}

class ShowErrorHomeState extends HomeState {
  String message;

  ShowErrorHomeState({this.message});
}