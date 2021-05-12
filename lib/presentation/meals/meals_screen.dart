import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/data/categories/categories_model.dart';
import 'package:food_app/data/meals/meals_model.dart';
import 'package:food_app/presentation/meals/bloc/meals_bloc.dart';
import 'package:food_app/presentation/meals/bloc/meals_event.dart';
import 'package:food_app/presentation/meals/bloc/meals_state.dart';
import 'package:food_app/presentation/meals/meals_view.dart';

class MealsScreen extends StatefulWidget {

  final CategoryData data;

  MealsScreen({this.data});

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {

  MealsBloc bloc;
  bool isLoading = false;
  List<MealData> list = [];

  @override
  void initState() {
    super.initState();
    bloc = MealsBloc();
    bloc.add(GetMealsEvent(category: widget.data.strCategory));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  Widget blocListener({Widget child}) {
    return BlocListener<MealsBloc, MealsState>(
      listener: (ctx, state) => print("state : $state"),
      cubit: bloc,
      child: child,
    );
  }

  Widget blocBuilder() {
    return BlocBuilder<MealsBloc, MealsState>(
      builder: (ctx, state) {
        if (state is InitMealsState) return main(isLoad: false);
        if (state is ShowLoadingMealsState) {
          isLoading = true;
          return main(isLoad: isLoading);
        }
        if (state is ShowMealsDataState) {
          if (isLoading) isLoading = false;
          list = state.list;
          return main(isLoad: isLoading);
        }
        if (state is ShowErrorMealsState) {
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
    return MealsView(isLoading: isLoad, list: list, data: widget.data);
  }
}
