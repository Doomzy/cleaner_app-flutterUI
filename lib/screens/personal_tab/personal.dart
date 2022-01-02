import 'package:cleaner_app_ui/providers/home_provider.dart';
import 'package:cleaner_app_ui/screens/personal_tab/personal_screens/settings.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget personalTab() => Consumer<HomeProvider>(
      builder: (context, hp, child) => Padding(
        padding: EdgeInsetsDirectional.all(25),
        child: Column(
          children: [
            customText(
              text: 'Extra network security protected your phone 1 day(s)',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              Color: Color.fromRGBO(74, 186, 242, 1),
            ),
            Divider(color: Colors.white, thickness: 2),
            SizedBox(height: 40),
            listOptions(
              header: 'Rate app',
              icon: 'assets/icons/rate.png',
            ),
            SizedBox(height: 30),
            listOptions(
              header: 'Share',
              icon: 'assets/icons/share.png',
            ),
            SizedBox(height: 30),
            listOptions(
              header: 'Feedback',
              icon: 'assets/icons/feedback.png',
            ),
            SizedBox(height: 30),
            listOptions(
              header: 'Settings',
              icon: 'assets/icons/settings.png',
              context: context,
              screen: settingsScreen(),
            ),
            SizedBox(height: 30),
            listOptions(
              header: 'Privacy policy',
              icon: 'assets/icons/policy.png',
            ),
          ],
        ),
      ),
    );
