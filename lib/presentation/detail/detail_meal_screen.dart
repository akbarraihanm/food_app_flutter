import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/data/meals/detail_meal_model.dart';
import 'package:food_app/data/meals/meals_model.dart';
import 'package:food_app/domain/database/database.dart';
import 'package:food_app/presentation/detail/bloc/detail_bloc.dart';
import 'package:food_app/presentation/detail/bloc/detail_event.dart';
import 'package:food_app/presentation/detail/bloc/detail_state.dart';
import 'package:food_app/presentation/detail/detail_meal_view.dart';

class DetailMealScreen extends StatefulWidget {

  final MealData data;

  DetailMealScreen({this.data});

  @override
  _DetailMealScreenState createState() => _DetailMealScreenState();
}

class _DetailMealScreenState extends State<DetailMealScreen> {

  DetailBloc bloc;
  bool isLoading = false;
  DetailMealData data;
  bool isFavorite = false;
  List<Food> list = [];
  int foodId;

  @override
  void initState() {
    super.initState();
    bloc = DetailBloc();
    bloc.add(GetDetailMealEvent(id: widget.data.idMeal));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  Widget blocListener({Widget child}) {
    return BlocListener<DetailBloc, DetailState>(
      listener: (ctx, state) => print("state : $state"),
      cubit: bloc,
      child: child,
    );
  }

  Widget blocBuilder() {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (ctx, state) {
        if (state is InitDetailState) return main(isLoad: false);
        if (state is ShowLoadingDetailState) {
          isLoading = true;
          return main(isLoad: isLoading);
        }
        if (state is ShowDetailDataState) {
          if (isLoading) isLoading = false;
          data = state.data;
          list = state.list;
          list.forEach((element) {
            if (element.idMeal == widget.data.idMeal) {
              isFavorite = true;
              foodId = element.id;
            }
          });
          return main(isLoad: isLoading);
        }
        if (state is ShowAddedToFavoriteState) {
          isFavorite = state.isFavorite;
          return main(isLoad: false);
        }
        if (state is ShowRemovedFromFavoriteState) {
          isFavorite = state.isFavorite;
          return main(isLoad: false);
        }
        if (state is ShowErrorDetailState) {
          if (isLoading) isLoading = false;
          Fluttertoast.showToast(msg: state.message);
          return main(isLoad: isLoading);
        }
        return Container();
      },
      cubit: bloc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return blocListener(child: blocBuilder());
  }

  Widget main({bool isLoad}) {
    return DetailMealView(
      data: data,
      foodId: foodId,
      mealData: widget.data,
      isFavorite: isFavorite,
      tapFavorite: (data) => bloc.add(AddToFavoriteEvent(food: data)),
      tapRemoveFavorite: (data) => bloc.add(RemoveFromFavoriteEvent(food: data)),
    );
  }
}
