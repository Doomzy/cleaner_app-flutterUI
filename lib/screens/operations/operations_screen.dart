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
                            color: op.operations[optId!.toInt()].color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 25,
                          ),
                          child: Center(
                            child: customText(
                              text: op.operations[optId!.toInt()].mainMsg,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        customButton(
                          () {
                            optId == 2 || optId == 3
                                ? op.startSearch(context, optId)
                                : op.validateOperaion(optId)
                                    ? customPopUp(
                                        context: context,
                                        text:
                                            'Operation cannot be started because theres no tasks',
                                        buttonT: 'Close',
                                        buttonF: () => Navigator.pop(context),
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
                      .toggletasks(e.key, 0),
              isEnabled: e.value,
              isSettings: true,
            );
          }).toList(),
        ),
      ),
    );
  }
}
