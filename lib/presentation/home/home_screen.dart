
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/data/categories/categories_model.dart';
import 'package:food_app/domain/database/database.dart';
import 'package:food_app/presentation/detail/detail_meal_screen.dart';
import 'package:food_app/presentation/home/bloc/home_bloc.dart';
import 'package:food_app/presentation/home/bloc/home_event.dart';
import 'package:food_app/presentation/home/bloc/home_state.dart';
import 'package:food_app/presentation/home/favorite_food_view.dart';
import 'package:food_app/presentation/home/home_view.dart';
import 'package:food_app/presentation/meals/meals_screen.dart';
import 'package:food_app/utils/app_navigator.dart';

import 'dialog_menu_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeBloc bloc;
  bool isLoading = false;
  List<CategoryData> list = [];
  List<Food> foodList = [];

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc();
    bloc.add(GetCategoriesHomeEvent());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  Widget blocListener({Widget child}) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (ctx, state) => print("state : $state"),
      cubit: bloc,
      child: child,
    );
  }

  Widget blocBuilder() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (ctx, state) {
        if (state is InitHomeState) return main(isLoad: false);
        if (state is ShowLoadingHomeState) {
          isLoading = true;
          return main(isLoad: isLoading);
        }
        if (state is ShowCategoriesDataHomeState) {
          if (isLoading) isLoading = false;
          list = state.list;
          return main(isLoad: isLoading);
        }
        if (state is ShowFavoriteFoodState) {
          foodList = state.list;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            showModalFavorite();
          });
          return main(isLoad: false);
        }
        if (state is ShowErrorHomeState) {
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
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return blocListener(child: blocBuilder());
  }

  Widget main({bool isLoad}) {
    return HomeView(
      list: list,
      isLoading: isLoad,
      onTapFavorite: () => bloc.add(GetFavoriteFoodEvent()),
      onTapItem: showMenuDialog,
    );
  }

  void showMenuDialog(CategoryData data) {
    showDialog(
        context: context,
        builder: (_) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Center(child: DialogMenuItem(data: data)),
        )
    ).then((value) {
      if (value != null) AppNavigator().push(context, child: MealsScreen(
        data: value,
      ));
    });
  }

  void showModalFavorite() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16)
        )
      ),
      builder: (ctx) => FavoriteFoodView(
        list: foodList,
        onTapItem: (data) {
          Navigator.pop(context);
          AppNavigator().push(context, child: DetailMealScreen(data: data));
        },
      )
    );
  }
}
