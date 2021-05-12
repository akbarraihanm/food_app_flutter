import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/categories/categories_model.dart';
import 'package:food_app/presentation/widgets/app_button.dart';
import 'package:food_app/presentation/widgets/app_text.dart';
import 'package:food_app/utils/app_color.dart';

class DialogMenuItem extends StatelessWidget {

  final CategoryData data;

  DialogMenuItem({this.data});

  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(data.strCategoryThumb,
                    height: 72, fit: BoxFit.cover),
              ),
              AppText(
                title: data.strCategory,
                color: AppColor.brownPrim,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 12),
              AppText(
                title: data.strCategoryDescription,
                color: AppColor.brownPrim,
              ),
              SizedBox(height: 24),
              AppButton(
                title: "Choose",
                color: AppColor.amberDark,
                onTap: () => Navigator.pop(context, data),
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
