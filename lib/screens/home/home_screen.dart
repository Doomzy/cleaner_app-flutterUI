import 'package:cleaner_app_ui/providers/home_provider.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, hp, child) => hp.splashOpen
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
          : Scaffold(
              appBar: AppBar(
                title: customText(text: 'Home', fontWeight: FontWeight.bold),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.all(25),
                      child: Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              circularProgressBar(
                                size: 175,
                                value: 0.85,
                                color: Color.fromRGBO(162, 230, 46, 1),
                                strokWidth: 12,
                              ),
                              circularProgressBar(
                                size: 120,
                                value: 0.9,
                                color: Color.fromRGBO(86, 204, 242, 1),
                                strokWidth: 12,
                              ),
                              Icon(
                                Icons.verified_user_outlined,
                                color: Colors.white,
                                size: 60,
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              statusInfo(
                                percentage: 85,
                                label: 'Memory used',
                                color: Color.fromRGBO(162, 230, 46, 1),
                                uStats: 3.4,
                                aStats: 4,
                              ),
                              SizedBox(height: 10),
                              statusInfo(
                                percentage: 90,
                                label: 'Storage used',
                                color: Color.fromRGBO(86, 204, 242, 1),
                                uStats: 113.92,
                                aStats: 128,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Wrap(
                      spacing: 10,
                      children: [
                        cleanerOpsBtn(
                            title: 'Phone boost',
                            icon: 'assets/icons/rocket.png'),
                        cleanerOpsBtn(
                            title: 'Battery saver',
                            icon: 'assets/icons/battery.png'),
                        cleanerOpsBtn(
                            title: 'App secure', icon: 'assets/icons/bug.png'),
                        cleanerOpsBtn(
                            title: 'Media', icon: 'assets/icons/folder.png'),
                        cleanerOpsBtn(
                            title: 'CPU cooler', icon: 'assets/icons/cpu.png'),
                        cleanerOpsBtn(
                            title: 'Planner', icon: 'assets/icons/clock.png'),
                      ],
                    ),
                    SizedBox(height: 40),
                    TextButton(
                      onPressed: () => hp.toggleOptHistory(),
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Row(
                        children: [
                          customText(
                              text: 'Optimization history', fontSize: 14),
                          Icon(
                            hp.optHistoryStatus
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
