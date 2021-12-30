import 'package:cleaner_app_ui/providers/splash_provider.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, gp, child) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedOpacity(
              opacity: gp.iconVis ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                'icons/Atom.png',
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(height: 50),
            customText(
              text: 'Extra smart',
              fontSize: 30,
              Color: Color.fromRGBO(76, 160, 46, 1),
              letteSpacing: 3,
            ),
            customText(
              text: 'CLEANER',
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 236),
          ],
        ),
      ),
    );
  }
}
