import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:food_app/domain/network/api_exception.dart';
import 'package:food_app/domain/repository/api_repository.dart';
import 'package:food_app/domain/repository/db_repository.dart';
import 'package:food_app/presentation/home/bloc/home_event.dart';
import 'package:food_app/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  ApiRepository repo;
  DbRepository dbRepo;

  HomeBloc() : super(InitHomeState()) {
    this.repo = ApiRepository.instance;
    this.dbRepo = DbRepository.instance;
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async*{
    if (event is GetCategoriesHomeEvent) {
      yield ShowLoadingHomeState();
      try {
        var categories = await repo.getCategories();
        yield ShowCategoriesDataHomeState(list: categories);
      }catch(ex) {
        if (ex is ErrorRequestException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorHomeState(message: message["message"]);
        } else if (ex is UnauthorizedException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorHomeState(message: message["message"]);
        } else {
          print("Error : $ex");
          yield ShowErrorHomeState(message: "Terjadi Kesalahan");
        }
      }
    }
    if (event is GetFavoriteFoodEvent) {
      try {
        var list = await dbRepo.getAllFoods();
        yield ShowFavoriteFoodState(list: list);
      }catch(ex) {
        if (ex is ErrorRequestException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorHomeState(message: message["message"]);
        } else if (ex is UnauthorizedException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorHomeState(message: message["message"]);
        } else {
          print("Error : $ex");
          yield ShowErrorHomeState(message: "Terjadi Kesalahan");
        }
      }
    }
  }

}