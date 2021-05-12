import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/categories/categories_model.dart';
import 'package:food_app/data/meals/meals_model.dart';
import 'package:food_app/presentation/detail/detail_meal_screen.dart';
import 'package:food_app/presentation/widgets/app_text.dart';
import 'package:food_app/utils/app_color.dart';
import 'package:food_app/utils/app_navigator.dart';

class MealsView extends StatefulWidget {

  final List<MealData> list;
  final CategoryData data;
  final bool isLoading;

  MealsView({this.list, this.isLoading, this.data});

  @override
  _MealsViewState createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.amberPrim,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          backTitle(),
          SizedBox(height: 16),
          Center(
            child: Image.network(widget.data.strCategoryThumb, height: 180),
          ),
          SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: list(),
            ),
          )
        ],
      ),
    );
  }

  Widget backTitle() {
    return Container(
      height: 48,
      child: Center(
        child: Stack(children: [
          Positioned(
            left: 0,
            child: IconButton(
              icon: Icon(Platform.isIOS ? CupertinoIcons.back :
              Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Center(
            child: AppText(
              title: widget.data.strCategory,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          )
        ]),
      ),
    );
  }

  Widget list() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: "List of ${widget.data.strCategory}'s food",
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 16),
        widget.isLoading ? Container(
          height: 200,
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        ) : Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.list.length,
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, pos) => Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: item(pos: pos),
            ),
          ),
        )
      ],
    );
  }

  Widget item({int pos}) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => AppNavigator().push(context,
          child: DetailMealScreen(data: widget.list[pos])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.list[pos].strMealThumb),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(8)
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: AppText(
              title: widget.list[pos].strMeal,
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
