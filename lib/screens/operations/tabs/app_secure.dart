import 'package:cleaner_app_ui/providers/operations_provider.dart';
import 'package:cleaner_app_ui/screens/operations/operations_screen.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSecureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OperationsProvider>(
      builder: (context, op, child) => Scaffold(
        appBar: AppBar(
          actions: [homeIcon(context)],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: customText(
                text: 'App secure',
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 35),
              color: Color.fromRGBO(255, 255, 255, 0.1),
              child: Row(
                children: [
                  customText(
                    text: 'Threats detected',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  customText(
                    text: op.secureOpts.length.toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.warning_rounded,
                    size: 25,
                    color: Colors.yellow[700],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: op.secureOpts.entries.map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Row(
                        children: [
                          Image.asset(e.key.iconPath.toString()),
                          SizedBox(width: 50),
                          customText(text: e.key.name, fontSize: 18),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: e.value
                                ? Colors.lightGreen
                                : Color.fromRGBO(50, 50, 50, 1),
                            radius: 12,
                            child: IconButton(
                              iconSize: 16,
                              color: Colors.white,
                              padding: EdgeInsetsDirectional.all(0),
                              onPressed: () => op.toggletasks(e.key, 2),
                              icon: e.value
                                  ? const Icon(Icons.check)
                                  : const Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            customPopUp(
              context: context,
              text: 'DELETE THREATS?',
              buttonT: 'OK',
              icon: Icons.bug_report,
              buttonF: () {
                op.validateOperaion(2)
                    ? customPopUp(
                        context: context,
                        text:
                            'Operation cannot be started because theres no tasks',
                        buttonT: 'Close',
                        buttonF: () => Navigator.pop(context),
                      )
                    : {
                        navigateToAndRemove(
                            context: context, destination: OperationsScreen(2)),
                        op.startAnim(2, context)
                      };
              },
            );
          },
          child: Icon(Icons.delete),
        ),
      ),
    );
  }
}
