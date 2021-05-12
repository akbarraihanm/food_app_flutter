import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/presentation/home/home_screen.dart';
import 'package:food_app/presentation/widgets/app_text.dart';
import 'package:food_app/utils/app_color.dart';
import 'package:food_app/utils/app_navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      AppNavigator().pushReplacement(context, child: HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: AppColor.amberLight,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/restaurant.png",
              width: 80,
              color: AppColor.amberDark,
            ),
            SizedBox(height: 24),
            AppText(
              title: "Food App",
              color: AppColor.amberDark,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}
