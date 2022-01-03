import 'package:cleaner_app_ui/providers/operations_provider.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperationsScreen extends StatelessWidget {
  int? optId;
  OperationsScreen(this.optId);
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
                text: op.operations[optId!.toInt()].name,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 25),
              op.operations[optId!.toInt()].done
                  ? customText(
                      text: op.operations[optId!.toInt()].doneMsg,
                      Color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )
                  : Visibility(
                      visible: !op.inProgress &&
                          op.operations[optId!.toInt()].name ==
                              'Boost optimaizer',
                      child: MaterialButton(
                        onPressed: () => customizeOpt(context: context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.app_registration,
                              color: Colors.white,
                            ),
                            customText(text: 'CUSTOMIZE', fontSize: 16),
                          ],
                        ),
                      ),
                    ),
              SizedBox(height: 25),
              operationIconAnim(
                startAnim: op.inProgress,
                opIcon: op.operations[optId!.toInt()].done
                    ? op.operations[optId!.toInt()].doneIcon
                    : op.operations[optId!.toInt()].icon,
                context: context,
              ),
              SizedBox(height: 40),
              op.inProgress || op.operations[optId!.toInt()].done
                  ? SizedBox(
                      height: 250,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: op.opTasks[optId!.toInt()].entries.map((e) {
                            if (e.value) {
                              return operationTasks(
                                name: e.key.name,
                                icon: e.key.iconPath,
                                done: e.key.done,
                              );
                            } else {
                              return SizedBox();
                            }
                          }).toList(),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 25,
                          ),
                          child: customText(
                            text: op.operations[optId!.toInt()].mainMsg,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 40),
                        customButton(
                          () {
                            op.validateOperaion(optId)
                                ? errorPopUp(
                                    context: context,
                                    text:
                                        'Operation cannot be started because theres no tasks',
                                  )
                                : op.startAnim(optId, context);
                          },
                          text: op.operations[optId!.toInt()].buttonText,
                          color: Color.fromRGBO(86, 204, 242, 1),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future customizeOpt({
    required context,
  }) {
    return showDialog(
      barrierColor: Colors.white10,
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 0),
        backgroundColor: Colors.black,
        titlePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        title: alertDialogTitle(
          context: context,
          text: '',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Provider.of<OperationsProvider>(context, listen: true)
              .boostingOpts
              .entries
              .map((e) {
            return toggleWidget(
              '',
              name: e.key.name,
              toggle: (b) =>
                  Provider.of<OperationsProvider>(context, listen: false)
                      .toggleBoosting(b, e.key),
              isEnabled: e.value,
              isSettings: true,
            );
          }).toList(),
        ),
      ),
    );
  }

  Future errorPopUp({required context, required text}) {
    return showDialog(
      barrierColor: Colors.white10,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        titlePadding: EdgeInsetsDirectional.only(top: 50, start: 25, end: 25),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            customText(
                text: text,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letteSpacing: 1.5,
                textAlign: TextAlign.center),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              textColor: Colors.green,
              child: Text(
                'OK',
              ),
            )
          ],
        ),
      ),
    );
  }
}
