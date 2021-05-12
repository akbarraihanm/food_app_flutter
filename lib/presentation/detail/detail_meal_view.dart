import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/data/meals/detail_meal_model.dart';
import 'package:food_app/data/meals/meals_model.dart';
import 'package:food_app/domain/database/database.dart';
import 'package:food_app/presentation/widgets/app_text.dart';
import 'package:food_app/utils/app_color.dart';

class DetailMealView extends StatefulWidget {

  final DetailMealData data;
  final MealData mealData;
  final Function(Food food) tapFavorite;
  final Function(Food food) tapRemoveFavorite;
  final bool isFavorite;
  final int foodId;

  DetailMealView({this.data, this.mealData, this.tapFavorite,
    this.tapRemoveFavorite, this.isFavorite, this.foodId});

  @override
  _DetailMealViewState createState() => _DetailMealViewState();
}

class _DetailMealViewState extends State<DetailMealView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.brownLight,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            backTitle(),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              child: Image.network(widget.mealData.strMealThumb, height: 180,
              width: double.infinity,
              fit: BoxFit.cover),
            ),
            widget.data == null ? Container(
              height: 75,
              child: Center(child: CupertinoActivityIndicator()),
            ) : dataView()
          ],
        ),
      ),
    );
  }

  Widget dataView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.amberPrim,
              borderRadius: BorderRadius.circular(10)
            ),
            child: AppText(
              title: widget.data.strCategory,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 24),
          AppText(
            title: "Here are the instructions",
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 16),
          AppText(
            title: widget.data.strInstructions,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget backTitle() {
    return Container(
      height: 48,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Platform.isIOS ? CupertinoIcons.back :
              Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: Center(
                child: AppText(
                  title: widget.mealData.strMeal,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            IconButton(
              icon: Icon(widget.isFavorite ? Icons.star : Icons.star_border,
                  color: AppColor.amberPrim),
              onPressed: () => tapStar(),
            )
          ],
        ),
      ),
    );
  }

  void tapStar() {
    if (widget.data != null) {
      if (widget.isFavorite) {
        Fluttertoast.showToast(msg: "Removed from Favorite");
        setState(() {});
        widget.tapRemoveFavorite(Food(
            id: widget.foodId,
            idMeal: widget.mealData.idMeal,
            strMealThumb: widget.mealData.strMealThumb,
            strMeal: widget.mealData.strMeal
        ));
      } else {
        Fluttertoast.showToast(msg: "Added to Favorite");
        setState(() {});
        widget.tapFavorite(Food(
            idMeal: widget.mealData.idMeal,
            strMealThumb: widget.mealData.strMealThumb,
            strMeal: widget.mealData.strMeal
        ));
      }
    }
  }
}
