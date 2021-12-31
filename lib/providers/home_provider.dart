import 'dart:async';

import 'package:cleaner_app_ui/screens/home/home_screen.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool optHistoryStatus = false;
  var currentTab = 0;

  void toggleOptHistory() {
    optHistoryStatus = !optHistoryStatus;
    notifyListeners();
  }

  void changeTab(i) {
    currentTab = i;
    notifyListeners();
  }

  bool iconVis = false;
  bool splashOpen = true;

  void showIcon() {
    Timer(Duration(seconds: 2), () {
      iconVis = true;
      notifyListeners();
    });
  }

  void startingApp(context) {
    Timer(Duration(seconds: 4), () {
      splashOpen = false;
      notifyListeners();
    });
  }
}
