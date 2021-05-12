
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/categories/categories_model.dart';
import 'package:food_app/presentation/widgets/app_text.dart';
import 'package:food_app/utils/app_color.dart';

class HomeView extends StatefulWidget {

  final List<CategoryData> list;
  final bool isLoading;
  final Function(CategoryData data) onTapItem;
  final Function onTapFavorite;

  HomeView({this.list, this.isLoading, this.onTapItem, this.onTapFavorite});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.amberPrim,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                AppText(
                  title: "Welcome to Food App!",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 24),
                Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(
                            "assets/images/foodpic.png"
                        ), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(16)
                    )
                ),
                SizedBox(height: 24),
                AppText(
                  title: "Here are our food categories",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 16),
                widget.isLoading ? Container(
                  height: 200,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ) : Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.5,
                    ),
                    padding: EdgeInsets.only(bottom: 16),
                    itemCount: widget.list.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, pos) => item(pos: pos),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => widget.onTapFavorite(),
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.star_fill,
                      size: 32,
                      color: Colors.black,
                    ),
                    AppText(title: "Tap to see favorite's item")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget layout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        AppText(
          title: "Welcome to Food App!",
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 24),
        Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(
                    "assets/images/foodpic.png"
                ), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(16)
            )
        ),
        SizedBox(height: 24),
        AppText(
          title: "Here are our food categories",
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 16),
        widget.isLoading ? Container(
          height: 200,
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        ) : Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            padding: EdgeInsets.only(bottom: 16),
            itemCount: widget.list.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, pos) => item(pos: pos),
          ),
        ),
      ],
    );
  }

  Widget item({int pos}) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => widget.onTapItem(widget.list[pos]),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(widget.list[pos].strCategoryThumb, height: 40),
            SizedBox(height: 16),
            AppText(title: widget.list[pos].strCategory, color: AppColor.brownPrim)
          ],
        ),
      ),
    );
  }
}
