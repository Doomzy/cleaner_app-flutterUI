import 'package:cleaner_app_ui/providers/toolbox_provider.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:collection/src/list_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppUninstallScreen extends StatelessWidget {
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
                customText(text: 'App uninstall', fontWeight: FontWeight.bold),
                SizedBox(height: 30),
                //user apps
                appListHeader(
                    title: 'User app',
                    toggleList: () => tp.toggleAppList(1),
                    isOpened: tp.uaOpen,
                    numOfApps: tp.userApps.length),
                SizedBox(height: 20),
                Visibility(
                  visible: tp.uaOpen,
                  child: Column(
                    children: tp.userApps.mapIndexed((index, element) {
                      return appsUninstallCtrl(
                        element.iconPath,
                        name: element.appName,
                        uninstall: () => tp.uninstallApp(1, index),
                      );
                    }).toList(),
                  ),
                ),
                //system apps
                appListHeader(
                    title: 'System app',
                    toggleList: () => tp.toggleAppList(2),
                    isOpened: tp.saOpen,
                    numOfApps: tp.systemApps.length),
                SizedBox(height: 20),
                Visibility(
                  visible: tp.saOpen,
                  child: Column(
                    children: tp.systemApps.mapIndexed((index, element) {
                      return appsUninstallCtrl(
                        element.iconPath,
                        name: element.appName,
                        uninstall: () => tp.uninstallApp(2, index),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
