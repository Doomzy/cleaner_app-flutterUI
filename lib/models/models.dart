class appModel {
  String? iconPath;
  String name;
  bool done = false;
  appModel(this.iconPath, this.name);
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
  String name;
  String mainMsg;
  String buttonText;
  bool done = false;
  operationModel({
    required this.icon,
    required this.doneIcon,
    required this.doneMsg,
    required this.name,
    required this.mainMsg,
    required this.buttonText,
  });
}
