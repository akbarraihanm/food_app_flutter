import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:food_app/domain/network/api_exception.dart';
import 'package:food_app/domain/repository/api_repository.dart';
import 'package:food_app/presentation/meals/bloc/meals_event.dart';
import 'package:food_app/presentation/meals/bloc/meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {

  ApiRepository repo;

  MealsBloc() : super(InitMealsState()) {
    this.repo = ApiRepository.instance;
  }

  @override
  Stream<MealsState> mapEventToState(MealsEvent event) async*{
    if (event is GetMealsEvent) {
      yield ShowLoadingMealsState();
      try {
        var list = await repo.getMeals(category: event.category);
        yield ShowMealsDataState(list: list);
      }catch(ex) {
        if (ex is ErrorRequestException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorMealsState(message: message["message"]);
        } else if (ex is UnauthorizedException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorMealsState(message: message["message"]);
        } else {
          print("Error : $ex");
          yield ShowErrorMealsState(message: "Terjadi Kesalahan");
        }
      }
    }
  }

}