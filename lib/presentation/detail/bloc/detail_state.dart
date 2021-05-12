import 'package:food_app/data/meals/detail_meal_model.dart';
import 'package:food_app/domain/database/database.dart';

abstract class DetailState {}

class InitDetailState extends DetailState {}

class ShowLoadingDetailState extends DetailState {}

class ShowDetailDataState extends DetailState {
  DetailMealData data;
  List<Food> list;

  ShowDetailDataState({this.data, this.list});
}

class ShowAddedToFavoriteState extends DetailState {
  bool isFavorite;

  ShowAddedToFavoriteState({this.isFavorite});
}

class ShowRemovedFromFavoriteState extends DetailState {
  bool isFavorite;

  ShowRemovedFromFavoriteState({this.isFavorite});
}

class ShowErrorDetailState extends DetailState {
  String message;

  ShowErrorDetailState({this.message});
}