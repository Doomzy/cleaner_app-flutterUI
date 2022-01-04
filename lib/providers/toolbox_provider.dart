import 'package:cleaner_app_ui/models/models.dart';
import 'package:flutter/material.dart';

class ToolboxProvider extends ChangeNotifier {
  bool uaOpen = false;
  bool saOpen = false;

  void toggleAppList(i) {
    i == 1 ? uaOpen = !uaOpen : saOpen = !saOpen;
    notifyListeners();
  }

  List<appModel> userApps = [
    appModel(iconPath: null, name: 'Facebook'),
    appModel(iconPath: null, name: 'Instagram'),
    appModel(iconPath: 'assets/icons/youtube.png', name: 'Youtube'),
    appModel(iconPath: null, name: 'Game'),
  ];

  List<appModel> systemApps = [
    appModel(iconPath: null, name: 'Google'),
    appModel(iconPath: 'assets/icons/photos.png', name: 'Photos'),
  ];

  void uninstallApp(lId, i) {
    lId == 1 ? userApps.removeAt(i) : systemApps.removeAt(i);
    notifyListeners();
  }

  Map<appModel, bool> socialNApps = {
    appModel(iconPath: null, name: 'Twitter'): true,
    appModel(iconPath: 'assets/icons/youtube.png', name: 'Youtube'): true,
  };

  Map<appModel, bool> thirdPApps = {
    appModel(iconPath: 'assets/icons/gmail.png', name: 'Gmail'): true,
    appModel(iconPath: 'assets/icons/translate.png', name: 'Translate'): false,
  };

  Map<appModel, bool> appLockApps = {
    appModel(iconPath: 'assets/icons/gmail.png', name: 'Gmail'): true,
    appModel(iconPath: 'assets/icons/gdrive.png', name: 'Google drive'): true,
    appModel(iconPath: 'assets/icons/calls.png', name: 'Calls'): true,
    appModel(iconPath: 'assets/icons/chrome.png', name: 'Chrome'): false,
    appModel(iconPath: 'assets/icons/maps.png', name: 'Maps'): false,
    appModel(iconPath: 'assets/icons/photos.png', name: 'Photos'): true,
    appModel(iconPath: 'assets/icons/translate.png', name: 'Translate'): false,
    appModel(iconPath: 'assets/icons/youtube.png', name: 'Youtube'): false,
  };

  void toggleSwitch(b, e, mId) {
    if (mId == 1)
      socialNApps[e] = b;
    else if (mId == 2)
      thirdPApps[e] = b;
    else
      appLockApps[e] = b;
    notifyListeners();
  }
}
