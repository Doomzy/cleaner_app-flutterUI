import 'package:cleaner_app_ui/models/models.dart';
import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier {
  Map<settingsModel, bool> genSettings = {
    settingsModel('Notification switcher', null): true,
    settingsModel('On', null): true,
  };
  Map<settingsModel, bool> notifSettings = {
    settingsModel('Phone boost reminder', 'Remind when memory overheating'):
        true,
    settingsModel('CPU cooler reminder', 'Remind me when CPU overheating'):
        true,
    settingsModel('Battery saver', 'Remind me when apps draining battery'):
        true,
    settingsModel('App install', 'Delete the APK file after app installed'):
        true,
    settingsModel('App uninstall', 'Delete the APK file after app unstalled'):
        true,
  };

  void toggleSettings(b, e, sId) {
    if (sId == 1)
      genSettings[e] = b;
    else
      notifSettings[e] = b;
    notifyListeners();
  }

  var startTime = '10:00 AM';
  var stopTime = '8:00 PM';

  void setTime(v, tId) {
    if (tId == 1)
      startTime = v;
    else
      stopTime = v;
    notifyListeners();
  }

  List reminderFrequincies = [
    'Every day',
    'Every 3 day',
    'Every 7 day',
    'Never remind',
  ];
  var reminderFreq = 0;

  void setFreq(i) {
    reminderFreq = i;
    notifyListeners();
  }
}
