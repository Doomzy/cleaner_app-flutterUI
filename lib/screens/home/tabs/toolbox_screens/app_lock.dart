import 'package:cleaner_app_ui/providers/toolbox_provider.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppLockScreen extends StatelessWidget {
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
                customText(text: 'App lock', fontWeight: FontWeight.bold),
                SizedBox(height: 30),
                customText(
                  text:
                      'The selected app`s will not be canceled during the cleanup',
                  fontSize: 14,
                ),
                Divider(color: Colors.white, thickness: 2),
                SizedBox(height: 20),
                Column(
                  children: tp.appLockApps.entries.map((e) {
                    return toggleWidget(
                      e.key.iconPath,
                      name: e.key.appName,
                      toggle: (b) => tp.toggleSwitch(b, e.key, 3),
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
