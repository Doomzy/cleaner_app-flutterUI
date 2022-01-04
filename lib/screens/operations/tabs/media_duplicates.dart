import 'package:cleaner_app_ui/providers/operations_provider.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../operations_screen.dart';

class MediaDuplicatesScreen extends StatelessWidget {
  String? title;
  MediaDuplicatesScreen(this.title);
  @override
  Widget build(BuildContext context) {
    return Consumer<OperationsProvider>(
      builder: (context, op, child) => Scaffold(
        appBar: AppBar(
          actions: [homeIcon(context)],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                text: title,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 550,
                child: GridView.count(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  children: op.mediaOpts.entries.map((e) {
                    return duplicateMedia(
                      image: e.key.iconPath,
                      selected: e.value,
                      onPressed: () => op.toggletasks(e.key, 3),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            customPopUp(
              context: context,
              text: 'Delete 500 Duplicate photos?',
              buttonT: 'OK',
              icon: Icons.burst_mode,
              buttonF: () {
                op.validateOperaion(3)
                    ? customPopUp(
                        context: context,
                        text:
                            'Operation cannot be started because theres no tasks',
                        buttonT: 'Close',
                        buttonF: () => Navigator.pop(context),
                      )
                    : {
                        navigateToAndRemove(
                            context: context, destination: OperationsScreen(3)),
                        op.startAnim(3, context)
                      };
              },
            );
          },
          child: Icon(Icons.delete),
        ),
      ),
    );
  }

  Widget duplicateMedia({
    required image,
    required bool selected,
    VoidCallback? onPressed,
  }) =>
      InkWell(
        onTap: onPressed,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              height: 35,
              color: Color.fromRGBO(0, 0, 0, 0.6),
              child: Row(
                children: [
                  Spacer(),
                  customText(text: '20 copies', fontSize: 10),
                  SizedBox(width: 10),
                  CircleAvatar(
                      backgroundColor: selected
                          ? Colors.lightGreen
                          : Color.fromRGBO(50, 50, 50, 1),
                      radius: 10,
                      child: Icon(
                        selected ? Icons.check : Icons.close,
                        size: 16,
                        color: Colors.white,
                      )),
                  SizedBox(width: 10),
                ],
              ),
            )
          ],
        ),
      );
}
