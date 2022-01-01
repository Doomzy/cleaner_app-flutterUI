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
    appModel(null, 'Facebook'),
    appModel(null, 'Instagram'),
    appModel('assets/icons/youtube.png', 'Youtube'),
    appModel(null, 'Game'),
  ];

  List<appModel> systemApps = [
    appModel(null, 'Google'),
    appModel('assets/icons/photos.png', 'Photos'),
  ];

  void uninstallApp(lId, i) {
    lId == 1 ? userApps.removeAt(i) : systemApps.removeAt(i);
    notifyListeners();
  }

  Map<appModel, bool> socialNApps = {
    appModel(null, 'Twitter'): true,
    appModel('assets/icons/youtube.png', 'Youtube'): true,
  };

  Map<appModel, bool> thirdPApps = {
    appModel('assets/icons/gmail.png', 'Gmail'): true,
    appModel('assets/icons/translate.png', 'Translate'): false,
  };

  Map<appModel, bool> appLockApps = {
    appModel('assets/icons/gmail.png', 'Gmail'): true,
    appModel('assets/icons/gdrive.png', 'Google drive'): true,
    appModel('assets/icons/calls.png', 'Calls'): true,
    appModel('assets/icons/chrome.png', 'Chrome'): false,
    appModel('assets/icons/maps.png', 'Maps'): false,
    appModel('assets/icons/photos.png', 'Photos'): true,
    appModel('assets/icons/translate.png', 'Translate'): false,
    appModel('assets/icons/youtube.png', 'Youtube'): false,
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
