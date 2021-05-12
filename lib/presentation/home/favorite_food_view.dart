import 'package:flutter/material.dart';
import 'package:food_app/data/meals/meals_model.dart';
import 'package:food_app/domain/database/database.dart';
import 'package:food_app/presentation/widgets/app_text.dart';

class FavoriteFoodView extends StatelessWidget {

  final List<Food> list;
  final Function(MealData data) onTapItem;

  FavoriteFoodView({this.list, this.onTapItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: list.isEmpty ? Container(
        height: 100,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title: "List of favorite's food",
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 24),
            Center(
              child: AppText(title: "No favorite food", color: Colors.black26),
            ),
          ],
        ),
      ) : Container(
        height: list.length > 10 ? 200 : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              title: "List of favorite's food",
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 16),
            listView()
          ],
        ),
      ),
    );
  }

  Widget listView() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: list.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, pos) => InkWell(
        onTap: () => onTapItem(MealData(
          strMeal: list[pos].strMeal,
          strMealThumb: list[pos].strMealThumb,
          idMeal: list[pos].idMeal
        )),
        child: Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(list[pos].strMealThumb, width: 56),
              ),
              SizedBox(width: 16),
              Expanded(
                child: AppText(title: list[pos].strMeal,
                    overflow: TextOverflow.ellipsis),
              )
            ],
          ),
        ),
      ),
    );
  }
}
