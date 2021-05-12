abstract class MealsEvent {}

class GetMealsEvent extends MealsEvent {
  String category;

  GetMealsEvent({this.category});
}