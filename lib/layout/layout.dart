import 'package:cleaner_app_ui/providers/home_provider.dart';
import 'package:cleaner_app_ui/providers/operations_provider.dart';
import 'package:cleaner_app_ui/providers/settings_provider.dart';
import 'package:cleaner_app_ui/providers/toolbox_provider.dart';
import 'package:cleaner_app_ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider()
            ..showSplashIcon()
            ..startingApp(context),
        ),
        ChangeNotifierProvider<ToolboxProvider>(
          create: (context) => ToolboxProvider(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider<OperationsProvider>(
          create: (context) => OperationsProvider()..addingTasks(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              elevation: 0,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
            ),
            scaffoldBackgroundColor: Colors.black,
            colorScheme: ColorScheme.fromSwatch(
              accentColor: Colors.green,
            )),
        home: HomeScreen(),
      ),
    );
  }
}
