import 'package:cleaner_app_ui/providers/operations_provider.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<OperationsProvider>(
          builder: (context, op, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 25, top: 10),
                child: customText(
                  text: 'Searching',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 110),
              operationIconAnim(
                startAnim: op.searching,
                opIcon: 'assets/animation/backgrounds/search.png',
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
