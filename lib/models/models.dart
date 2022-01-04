import 'package:flutter/material.dart';

class appModel {
  String? iconPath;
  String name;
  bool done = false;
  appModel({this.iconPath, required this.name});
}

class settingsModel {
  String name;
  String? info;
  settingsModel(this.name, this.info);
}

class operationModel {
  String icon;
  String doneIcon;
  String doneMsg;
  Color color;
  String name;
  String mainMsg;
  String buttonText;
  bool done = false;
  operationModel({
    required this.icon,
    required this.doneIcon,
    required this.doneMsg,
    required this.color,
    required this.name,
    required this.mainMsg,
    required this.buttonText,
  });
}
