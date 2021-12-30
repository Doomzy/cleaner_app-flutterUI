import 'dart:async';
import 'package:cleaner_app_ui/screens/home/home_screen.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/cupertino.dart';

class SplashProvider extends ChangeNotifier {
  bool iconVis = false;

  void showIcon() {
    Timer(Duration(seconds: 2), () {
      iconVis = true;
      notifyListeners();
    });
  }

  void startingApp(context) {
    Timer(Duration(seconds: 4), () {
      navigateToAndRemove(context: context, destination: HomeScreen());
    });
  }
}
