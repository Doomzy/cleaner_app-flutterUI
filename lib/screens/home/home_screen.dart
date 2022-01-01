import 'package:cleaner_app_ui/providers/home_provider.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, hp, child) => hp.splashOpen
          //splash screen
          ? Visibility(
              visible: hp.splashOpen,
              child: Scaffold(
                body: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedOpacity(
                        opacity: hp.iconVis ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: Image.asset(
                          'assets/icons/Atom.png',
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
              ),
            )
          //home screen
          : Scaffold(
              appBar: AppBar(
                title: customText(
                    text: hp.homeTabsNames[hp.currentTab],
                    fontWeight: FontWeight.bold),
              ),
              body: SingleChildScrollView(
                child: hp.homeTabs[hp.currentTab],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: hp.currentTab,
                onTap: (i) => hp.changeTab(i),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 30),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_repair_service, size: 30),
                      label: 'Toolbox'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 30),
                    label: 'Personal',
                  ),
                ],
              ),
            ),
    );
  }
}
