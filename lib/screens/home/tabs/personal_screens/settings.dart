import 'package:cleaner_app_ui/providers/settings_provider.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:collection/src/list_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class settingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Consumer<SettingsProvider>(
          builder: (context, sp, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(text: 'Settings', fontWeight: FontWeight.bold),
              Divider(color: Colors.white, thickness: 2),
              SizedBox(height: 20),
              //general settings
              customText(
                text: 'General settings',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: EdgeInsetsDirectional.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    toggleWidget(
                      '',
                      name: sp.genSettings.keys.first.name,
                      toggle: (b) =>
                          sp.toggleSettings(b, sp.genSettings.keys.first, 1),
                      isEnabled: sp.genSettings.values.first,
                      isSettings: true,
                    ),
                    defaultListWidget(
                      title: 'Create shortcut',
                      info: 'Create home screen shortcut',
                      padding: 0.0,
                      onTap: () {},
                    ),
                    SizedBox(height: 20),
                    listTimeWiget(
                      onTap: () => timePopUp(
                        context: context,
                        toggleSetting: sp.genSettings.entries.last,
                      ),
                      title: 'Do not disturb',
                      info: '${sp.startTime}-${sp.stopTime}',
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              //notification settings
              customText(
                text: 'Notification settings',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              defaultListWidget(
                title: 'Junk reminder frequency',
                info: sp.reminderFrequincies[sp.reminderFreq],
                onTap: () => reminderPopUp(
                  context: context,
                  jrfList: sp.reminderFrequincies,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.all(20),
                child: Column(
                  children: sp.notifSettings.entries.map((e) {
                    return toggleWidget('',
                        name: e.key.name,
                        toggle: (b) => sp.toggleSettings(b, e.key, 2),
                        isEnabled: e.value,
                        isSettings: true,
                        info: e.key.info);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void customTimePicker({context, tId}) => showTimePicker(
          context: context,
          hourLabelText: 'Hour',
          minuteLabelText: 'Minute',
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
              )).then(
        (value) => Provider.of<SettingsProvider>(context, listen: false)
            .setTime(value!.format(context), tId),
      );

  Future timePopUp({
    required context,
    required toggleSetting,
  }) {
    bool switchStatus = toggleSetting.value;
    return showDialog(
      barrierColor: Colors.white10,
      context: context,
      builder: (context) => AlertDialog(
        titlePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        title: alertDialogTitle(context: context, text: 'DO NOT DISTURB'),
        backgroundColor: Colors.black,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            toggleWidget(
              '',
              name: toggleSetting.key.name,
              toggle: (b) {
                Provider.of<SettingsProvider>(context, listen: false)
                    .toggleSettings(b, toggleSetting.key, 1);
                switchStatus = b;
              },
              isEnabled: switchStatus,
              isSettings: true,
            ),
            listTimeWiget(
              onTap: () {
                customTimePicker(context: context, tId: 1);
              },
              title: 'Start at',
              info: Provider.of<SettingsProvider>(context, listen: true)
                  .startTime,
            ),
            SizedBox(height: 25),
            listTimeWiget(
              onTap: () {
                customTimePicker(context: context, tId: 2);
              },
              title: 'Stop at',
              info:
                  Provider.of<SettingsProvider>(context, listen: true).stopTime,
            ),
          ],
        ),
      ),
    );
  }

  Future reminderPopUp({
    required context,
    required List jrfList,
  }) {
    return showDialog(
      barrierColor: Colors.white10,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        titlePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        title: alertDialogTitle(
          context: context,
          text: 'JUNK REMINDER FREQUENCY',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: jrfList.mapIndexed((i, e) {
            return MaterialButton(
              onPressed: () {
                Provider.of<SettingsProvider>(context, listen: false)
                    .setFreq(i);
                Navigator.pop(context);
              },
              child: customText(
                text: e,
                fontSize: 14,
                Color: i ==
                        Provider.of<SettingsProvider>(context, listen: true)
                            .reminderFreq
                    ? Colors.green
                    : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
