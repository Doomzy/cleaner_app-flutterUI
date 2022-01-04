import 'dart:async';

import 'package:cleaner_app_ui/models/models.dart';
import 'package:cleaner_app_ui/screens/operations/tabs/app_secure.dart';
import 'package:cleaner_app_ui/screens/operations/tabs/media.dart';
import 'package:cleaner_app_ui/screens/operations/tabs/searching.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';

class OperationsProvider extends ChangeNotifier {
  Map<appModel, bool> boostingOpts = {
    appModel(iconPath: null, name: 'Delete background processes'): true,
    appModel(iconPath: null, name: 'Clean up system paths'): true,
    appModel(iconPath: null, name: 'Adjust the system keys'): true,
    appModel(iconPath: null, name: 'Check unused components'): true,
    appModel(iconPath: null, name: 'Disconnect from unnecessary GPS towers'):
        true,
    appModel(
        iconPath: null,
        name: 'Check for deviations from the factory settings'): true,
    appModel(iconPath: null, name: 'Check hidden notifications'): true,
  };

  Map<appModel, bool> optimizaitionOpts = {
    appModel(iconPath: null, name: 'Decrease in brightness'): true,
    appModel(iconPath: null, name: 'Сlosing apps'): true,
    appModel(iconPath: null, name: 'Turn off the sound'): true,
    appModel(iconPath: null, name: 'Сlosing apps'): true,
    appModel(iconPath: null, name: 'Vibration feedback of the keyboard'): true,
    appModel(iconPath: null, name: 'Enable battery saving mode'): true,
    appModel(iconPath: null, name: 'Reduce waiting time'): true,
  };

  Map<appModel, bool> secureOpts = {
    appModel(iconPath: 'assets/icons/gmail.png', name: 'Gmail'): true,
    appModel(iconPath: 'assets/icons/gdrive.png', name: 'Google drive'): true,
    appModel(iconPath: 'assets/icons/chrome.png', name: 'Chrome'): true,
    appModel(iconPath: 'assets/icons/maps.png', name: 'Maps'): true,
    appModel(iconPath: 'assets/icons/photos.png', name: 'Photos'): true,
    appModel(iconPath: 'assets/icons/translate.png', name: 'Translate'): true,
    appModel(iconPath: 'assets/icons/youtube.png', name: 'Youtube'): true,
  };

  Map<appModel, bool> mediaOpts = {
    appModel(iconPath: 'assets/media/dup1.png', name: 'Portfolio shoot.jpeg'):
        true,
    appModel(iconPath: 'assets/media/dup5.png', name: 'Baby Shower.jpeg'): true,
    appModel(iconPath: 'assets/media/dup6.png', name: 'New born.jpeg'): true,
    appModel(iconPath: 'assets/media/dup6.png', name: 'Clothes branding.jpeg'):
        true,
    appModel(
        iconPath: 'assets/media/dup1.png',
        name: 'The Count of Monte Cristo.jpeg'): true,
    appModel(iconPath: 'assets/media/dup5.png', name: 'Family photo.jpeg'):
        true,
    appModel(iconPath: 'assets/media/dup5.png', name: 'Material shoot.jpeg'):
        true,
    appModel(iconPath: 'assets/media/dup1.png', name: 'The Alchemist.jpeg'):
        true,
  };

  Map<appModel, bool> cpuOpts = {
    appModel(iconPath: 'assets/icons/youtube.png', name: 'Youtube'): true,
    appModel(iconPath: 'assets/icons/calls.png', name: 'Calls'): true,
    appModel(iconPath: 'assets/icons/gmail.png', name: 'Gmail'): true,
    appModel(iconPath: 'assets/icons/gdrive.png', name: 'Google drive'): true,
    appModel(iconPath: 'assets/icons/chrome.png', name: 'Chrome'): true,
    appModel(iconPath: 'assets/icons/maps.png', name: 'Maps'): true,
    appModel(iconPath: 'assets/icons/photos.png', name: 'Photos'): true,
    appModel(iconPath: 'assets/icons/translate.png', name: 'Translate'): true,
  };

  List<Map> opTasks = [];

  void addingTasks() {
    opTasks.add(boostingOpts);
    opTasks.add(optimizaitionOpts);
    opTasks.add(secureOpts);
    opTasks.add(mediaOpts);
    opTasks.add(cpuOpts);
  }

  void toggletasks(e, i) {
    opTasks[i][e] = !opTasks[i][e];
    notifyListeners();
  }

  var tasksCount;

  bool validateOperaion(i) {
    tasksCount = 0;
    opTasks[i].values.forEach((e) {
      if (e == false) {
        tasksCount += 1;
      }
    });

    if (tasksCount == opTasks[i].length) {
      return true;
    } else {
      return false;
    }
  }

  bool inProgress = false;

  var currentAnim = 0;
  var currentTask = 0;
  var animController = AnimationController;

  List<operationModel> operations = [
    operationModel(
      icon: 'assets/animation/backgrounds/phone-boost.png',
      doneIcon: 'assets/animation/backgrounds/boost-done.png',
      doneMsg: 'Boosted',
      color: Color.fromRGBO(255, 255, 255, 0.1),
      name: 'Boost optimaizer',
      mainMsg:
          'Reduce device usage for faster performance and lower battery drain',
      buttonText: 'Boost',
    ),
    operationModel(
      icon: 'assets/animation/backgrounds/battery-saver.png',
      doneIcon: 'assets/animation/backgrounds/battery-done.png',
      doneMsg: 'Optimized',
      color: Colors.red,
      name: 'Battery saver',
      mainMsg: 'Charging time remanig 0 h 30 m',
      buttonText: 'Optimize',
    ),
    operationModel(
      icon: 'assets/animation/backgrounds/app-secure.png',
      doneIcon: 'assets/animation/backgrounds/secure-done.png',
      doneMsg: 'Cleaned',
      color: Colors.red,
      name: 'App secure',
      mainMsg: 'Threats detected',
      buttonText: 'Search',
    ),
    operationModel(
      icon: 'assets/animation/backgrounds/media.png',
      doneIcon: 'assets/animation/steps/anim8.png',
      doneMsg: 'Cleaned',
      color: Color.fromRGBO(255, 255, 255, 0.1),
      name: 'Media',
      mainMsg: 'Your permission is required to delete media',
      buttonText: 'Give a permission',
    ),
    operationModel(
      icon: 'assets/animation/backgrounds/cpu-cooler.png',
      doneIcon: 'assets/animation/backgrounds/cooler-done.png',
      doneMsg: 'Cooled',
      color: Colors.red,
      name: 'CPU cooler',
      mainMsg: 'Temperature is 40.0°C Need to cool down',
      buttonText: 'Cool',
    ),
  ];

  void startAnim(optId, context) {
    currentAnim = 0;
    currentTask = 0;
    inProgress = true;
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (currentTask < opTasks[optId].length) {
        opTasks[optId].keys.elementAt(currentTask).done = true;
        notifyListeners();
        currentTask++;
      } else {
        operations[optId].done = true;
        inProgress = false;
        notifyListeners();
        timer.cancel();
      }
    });
  }

  List plans = [];

  void deletePlan(i) {
    plans.removeAt(i);
    notifyListeners();
  }

  void openTimePlanner(context) {
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) => Theme(
              data: ThemeData(
                colorScheme: const ColorScheme.dark(
                  primary: Color.fromRGBO(76, 160, 46, 1),
                  surface: Colors.black,
                  onSurface: Colors.white,
                  background: Color.fromRGBO(255, 255, 255, 0.1),
                  secondary: Colors.white,
                ),
              ),
              child: child ?? Text(''),
            )).then((value) {
      plans.add(value!.format(context).toString());
      notifyListeners();
    });
  }

  bool searching = false;

  void startSearch(context, i) {
    searching = true;
    navigateTo(context: context, destination: SearchingScreen());
    Timer(Duration(seconds: 8), () {
      searching = false;
      notifyListeners();
      if (i == 2) {
        Navigator.pop(context);
        navigateTo(context: context, destination: AppSecureScreen());
      } else {
        navigateTo(context: context, destination: MediaScreen());
      }
    });
  }
}
