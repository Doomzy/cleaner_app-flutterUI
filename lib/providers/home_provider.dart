import 'dart:async';

import 'package:cleaner_app_ui/screens/home/tabs/home.dart';
import 'package:cleaner_app_ui/screens/home/tabs/personal.dart';
import 'package:cleaner_app_ui/screens/home/tabs/toolbox.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  //splash
  bool iconVis = false;
  bool splashOpen = true;

  void showSplashIcon() {
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

  //home
  bool optHistoryStatus = false;
  var currentTab = 0;
  List<Widget> homeTabs = [homeTab(), toolboxTab(), personalTab()];

  void toggleOptHistory() {
    optHistoryStatus = !optHistoryStatus;
    notifyListeners();
  }

  void changeTab(i) {
    currentTab = i;
    notifyListeners();
  }
}
