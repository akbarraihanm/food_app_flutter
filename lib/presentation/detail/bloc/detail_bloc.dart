import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:food_app/domain/network/api_exception.dart';
import 'package:food_app/domain/repository/api_repository.dart';
import 'package:food_app/domain/repository/db_repository.dart';
import 'package:food_app/presentation/detail/bloc/detail_event.dart';
import 'package:food_app/presentation/detail/bloc/detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {

  ApiRepository repo;
  DbRepository dbRepo;

  DetailBloc() : super(InitDetailState()) {
    this.repo = ApiRepository.instance;
    this.dbRepo = DbRepository.instance;
  }

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async*{
    if (event is GetDetailMealEvent) {
      yield ShowLoadingDetailState();
      try {
        var data = await repo.getDetailMeal(id: event.id);
        var food = await dbRepo.getAllFoods();
        yield ShowDetailDataState(data: data, list: food);
      }catch(ex) {
        if (ex is ErrorRequestException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorDetailState(message: message["message"]);
        } else if (ex is UnauthorizedException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorDetailState(message: message["message"]);
        } else {
          print("Error : $ex");
          yield ShowErrorDetailState(message: "Terjadi Kesalahan");
        }
      }
    }
    if (event is AddToFavoriteEvent) {
      try {
        await dbRepo.insertFood(event.food);
        yield ShowAddedToFavoriteState(isFavorite: true);
      }catch(ex) {
        if (ex is ErrorRequestException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorDetailState(message: message["message"]);
        } else if (ex is UnauthorizedException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorDetailState(message: message["message"]);
        } else {
          print("Error : $ex");
          yield ShowErrorDetailState(message: "Terjadi Kesalahan");
        }
      }
    }
    if (event is RemoveFromFavoriteEvent) {
      try {
        await dbRepo.deleteFood(event.food);
        yield ShowRemovedFromFavoriteState(isFavorite: false);
      }catch(ex) {
        if (ex is ErrorRequestException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorDetailState(message: message["message"]);
        } else if (ex is UnauthorizedException) {
          var message = jsonDecode(ex.errorBody);
          yield ShowErrorDetailState(message: message["message"]);
        } else {
          print("Error : $ex");
          yield ShowErrorDetailState(message: "Terjadi Kesalahan");
        }
      }
    }
  }

}