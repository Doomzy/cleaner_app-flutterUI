import 'dart:async';

import 'package:cleaner_app_ui/models/models.dart';
import 'package:flutter/material.dart';

class OperationsProvider extends ChangeNotifier {
  Map<appModel, bool> boostingOpts = {
    appModel(null, 'Delete background processes'): true,
    appModel(null, 'Clean up system paths'): true,
    appModel(null, 'Adjust the system keys'): true,
    appModel(null, 'Check unused components'): true,
    appModel(null, 'Disconnect from unnecessary GPS towers'): true,
    appModel(null, 'Check for deviations from the factory settings'): true,
    appModel(null, 'Check hidden notifications'): true,
  };

  Map<appModel, bool> optimizaitionOpts = {
    appModel(null, 'Decrease in brightness'): true,
    appModel(null, 'Сlosing apps'): true,
    appModel(null, 'Turn off the sound'): true,
    appModel(null, 'Сlosing apps'): true,
    appModel(null, 'Vibration feedback of the keyboard'): true,
    appModel(null, 'Enable battery saving mode'): true,
    appModel(null, 'Reduce waiting time'): true,
  };

  Map<appModel, bool> secureOpts = {
    appModel('assets/icons/gmail.png', 'Gmail'): true,
    appModel('assets/icons/gdrive.png', 'Google drive'): true,
    appModel('assets/icons/chrome.png', 'Chrome'): true,
    appModel('assets/icons/maps.png', 'Maps'): true,
    appModel('assets/icons/photos.png', 'Photos'): true,
    appModel('assets/icons/translate.png', 'Translate'): true,
    appModel('assets/icons/youtube.png', 'Youtube'): true,
  };

  Map<appModel, bool> mediaOpts = {
    appModel(null, 'Portfolio shoot.jpeg'): true,
    appModel(null, 'Baby Shower.jpeg'): true,
    appModel(null, 'New born.jpeg'): true,
    appModel(null, 'Clothes branding.jpeg'): true,
    appModel(null, 'The Count of Monte Cristo.jpeg'): true,
    appModel(null, 'Family photo.jpeg'): true,
    appModel(null, 'Material shoot.jpeg'): true,
    appModel(null, 'The Alchemist.jpeg'): true,
  };

  Map<appModel, bool> cpuOpts = {
    appModel('assets/icons/youtube.png', 'Youtube'): true,
    appModel('assets/icons/calls.png', 'Calls'): true,
    appModel('assets/icons/gmail.png', 'Gmail'): true,
    appModel('assets/icons/gdrive.png', 'Google drive'): true,
    appModel('assets/icons/chrome.png', 'Chrome'): true,
    appModel('assets/icons/maps.png', 'Maps'): true,
    appModel('assets/icons/photos.png', 'Photos'): true,
    appModel('assets/icons/translate.png', 'Translate'): true,
  };

  List<Map> opTasks = [];

  void addingTasks() {
    opTasks.add(boostingOpts);
    opTasks.add(optimizaitionOpts);
    opTasks.add(secureOpts);
    opTasks.add(mediaOpts);
    opTasks.add(cpuOpts);
  }

  void toggleBoosting(b, e) {
    boostingOpts[e] = b;
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

    if (tasksCount == opTasks[i].length)
      return true;
    else
      return false;
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
      name: 'Boost optimaizer',
      mainMsg:
          'Reduce device usage for faster performance and lower battery drain',
      buttonText: 'Boost',
    ),
    operationModel(
      icon: 'assets/animation/backgrounds/battery-saver.png',
      doneIcon: 'assets/animation/backgrounds/battery-done.png',
      doneMsg: 'Optimized',
      name: 'Battery saver',
      mainMsg: 'Charging time remanig 0 h 30 m',
      buttonText: 'Optimize',
    ),
    operationModel(
      icon: 'assets/animation/backgrounds/app-secure.png',
      doneIcon: 'assets/animation/backgrounds/secure-done.png',
      doneMsg: 'Cleaned',
      name: 'App secure',
      mainMsg: 'Threats detected',
      buttonText: 'Search',
    ),
    operationModel(
      icon: 'assets/animation/backgrounds/media.png',
      doneIcon: 'assets/animation/steps/anim8.png',
      doneMsg: 'Cleaned',
      name: 'Media',
      mainMsg: 'Your permission is required to delete media',
      buttonText: 'Give a permission',
    ),
    operationModel(
      icon: 'assets/animation/backgrounds/cpu-cooler.png',
      doneIcon: 'assets/animation/backgrounds/cooler-done.png',
      doneMsg: 'Cooled',
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
}
