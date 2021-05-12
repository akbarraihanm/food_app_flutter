import 'package:food_app/domain/database/database.dart';

abstract class DetailEvent {}

class GetDetailMealEvent extends DetailEvent {
  String id;

  GetDetailMealEvent({this.id});
}

class AddToFavoriteEvent extends DetailEvent {
  Food food;

  AddToFavoriteEvent({this.food});
}

class RemoveFromFavoriteEvent extends DetailEvent {
  Food food;

  RemoveFromFavoriteEvent({this.food});
}