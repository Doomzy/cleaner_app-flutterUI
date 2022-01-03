import 'package:cleaner_app_ui/providers/operations_provider.dart';
import 'package:cleaner_app_ui/screens/operations/operations_screen.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:collection/src/list_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [homeIcon(context)],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Consumer<OperationsProvider>(
            builder: (context, op, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: 'Planner',
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    opsButton(
                      icon: 'assets/icons/rocket-white.png',
                      screen: OperationsScreen(0),
                      context: context,
                    ),
                    Spacer(),
                    opsButton(
                      icon: 'assets/icons/battery-white.png',
                      screen: OperationsScreen(1),
                      context: context,
                    ),
                    Spacer(),
                    opsButton(
                      icon: 'assets/icons/cpu-white.png',
                      screen: OperationsScreen(2),
                      context: context,
                    ),
                    Spacer(),
                    opsButton(
                      icon: 'assets/icons/bug-white.png',
                      screen: OperationsScreen(3),
                      context: context,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Center(
                  child: Icon(
                    op.plans.length == 0 ? Icons.alarm_off : Icons.alarm_on,
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                    size: 85,
                  ),
                ),
                SizedBox(height: 40),
                MaterialButton(
                  onPressed: () => op.openTimePlanner(context),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  color: Color.fromRGBO(255, 255, 255, 0.1),
                  child: Row(
                    children: [
                      Icon(
                        Icons.alarm_add,
                        color: Color.fromRGBO(74, 186, 242, 1),
                      ),
                      SizedBox(width: 20),
                      customText(
                        text: 'Add cleaning time',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: op.plans.mapIndexed((i, e) {
                    return Row(
                      children: [
                        IconButton(
                          onPressed: () => op.deletePlan(i),
                          icon: Icon(Icons.highlight_off),
                          color: Colors.white,
                        ),
                        customText(
                          text: e,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ));
  }

  Widget opsButton({required icon, required screen, required context}) =>
      MaterialButton(
        onPressed: () => navigateTo(context: context, destination: screen),
        minWidth: 75,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Image.asset(icon),
        color: Color.fromRGBO(86, 204, 242, 1),
      );
}
