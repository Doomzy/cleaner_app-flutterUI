import 'package:cleaner_app_ui/providers/operations_provider.dart';
import 'package:cleaner_app_ui/screens/operations/tabs/media_duplicates.dart';
import 'package:cleaner_app_ui/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediaScreen extends StatelessWidget {
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
                text: 'Media',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 500,
                child: GridView.count(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  children: [
                    catButton(
                      title: 'Duplicate photos',
                      icon: Icons.burst_mode,
                      count: op.mediaOpts.length,
                      onTap: () => navigateTo(
                        context: context,
                        destination: MediaDuplicatesScreen('Duplicate photos'),
                      ),
                    ),
                    catButton(
                      title: 'Screenshots',
                      icon: Icons.screenshot,
                    ),
                    catButton(
                      title: 'Duplicate videos',
                      icon: Icons.video_library,
                    ),
                    catButton(
                      title: 'Selfies',
                      icon: Icons.camera_front,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget catButton(
          {count = 0, required title, required icon, VoidCallback? onTap}) =>
      InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  customText(
                      text: title, fontSize: 14, fontWeight: FontWeight.bold),
                  Spacer(),
                  Icon(
                    icon,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    size: 24,
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsetsDirectional.all(10),
                    child: customText(
                      text: count.toString(),
                      fontSize: 14,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}
