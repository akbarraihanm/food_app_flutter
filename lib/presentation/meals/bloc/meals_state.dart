import 'package:food_app/data/meals/meals_model.dart';

abstract class MealsState {}

class InitMealsState extends MealsState {}

class ShowLoadingMealsState extends MealsState {}

class ShowMealsDataState extends MealsState {
  List<MealData> list;

  ShowMealsDataState({this.list});
}

class ShowErrorMealsState extends MealsState {
  String message;

  ShowErrorMealsState({this.message});
}