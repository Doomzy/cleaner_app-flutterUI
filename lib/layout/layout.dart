import 'package:cleaner_app_ui/providers/splash_provider.dart';
import 'package:cleaner_app_ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashProvider>(
          create: (context) => SplashProvider()
            ..showIcon()
            ..startingApp(context),
        )
      ],
      builder: (context, child) => Scaffold(
        appBar: AppBar(),
        body: SplashScreen(),
      ),
    );
  }
}
