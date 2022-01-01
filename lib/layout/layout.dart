import 'package:cleaner_app_ui/providers/home_provider.dart';
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
      ],
      builder: (context, child) => HomeScreen(),
    );
  }
}
