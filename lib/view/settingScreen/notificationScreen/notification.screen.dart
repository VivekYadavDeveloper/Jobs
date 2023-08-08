import 'package:flutter/material.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool switchNotifi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints contraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
                title: Text(
                  "Turn on Notification",
                  style: TextStyle(color: AppColors.whiteColor),
                ),
                value: switchNotifi,
                onChanged: (bool newValue) {
                  setState(() {

                  });
                  switchNotifi = newValue;
                })
          ],
        );
      }),
    );
  }
}
