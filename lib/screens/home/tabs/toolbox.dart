import 'package:cleaner_app_ui/providers/home_provider.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'toolbox_screens/app_lock.dart';
import 'toolbox_screens/app_unin.dart';
import 'toolbox_screens/notification.dart';

Widget toolboxTab() => Consumer<HomeProvider>(
      builder: (context, hp, child) => Padding(
        padding: EdgeInsetsDirectional.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
              text: 'Clean boost',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letteSpacing: 1.5,
            ),
            SizedBox(height: 20),
            listOptions(
              header: 'App uninstall',
              info: 'Rapidly uninstall useless apps',
              icon: 'assets/icons/android.png',
              context: context,
              screen: AppUninstallScreen(),
            ),
            SizedBox(height: 40),
            customText(
              text: 'Security & Privacy',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letteSpacing: 1.5,
            ),
            SizedBox(height: 20),
            listOptions(
              header: 'Notification',
              info: 'Make messy notification bar fresh again',
              icon: 'assets/icons/notification.png',
              context: context,
              screen: NotificationScreen(),
            ),
            SizedBox(height: 20),
            listOptions(
              header: 'App lock',
              info: 'Protect the privacy data and the property',
              icon: 'assets/icons/lock.png',
              context: context,
              screen: AppLockScreen(),
            ),
          ],
        ),
      ),
    );
