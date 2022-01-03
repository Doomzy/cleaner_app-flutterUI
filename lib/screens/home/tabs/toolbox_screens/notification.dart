import 'package:cleaner_app_ui/providers/toolbox_provider.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Consumer<ToolboxProvider>(
          builder: (context, tp, child) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(text: 'Notification', fontWeight: FontWeight.bold),
                SizedBox(height: 30),
                //Social network app
                customText(
                  text: 'Social network app',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 20),
                Column(
                  children: tp.socialNApps.entries.map((e) {
                    return toggleWidget(
                      e.key.iconPath,
                      name: e.key.name,
                      toggle: (b) => tp.toggleSwitch(b, e.key, 1),
                      isEnabled: e.value,
                    );
                  }).toList(),
                ),
                SizedBox(height: 30),
                //Third party application
                customText(
                  text: 'Third party application',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 20),
                Column(
                  children: tp.thirdPApps.entries.map((e) {
                    return toggleWidget(
                      e.key.iconPath,
                      name: e.key.name,
                      toggle: (b) => tp.toggleSwitch(b, e.key, 2),
                      isEnabled: e.value,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
