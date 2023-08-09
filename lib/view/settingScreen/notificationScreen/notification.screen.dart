import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';
import 'package:inductus_jobs/app/routes/app.routes.dart';
import 'package:inductus_jobs/view/Widgets/custom.back.btn.dart';

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
        automaticallyImplyLeading: true,
        leading:
            // IconButton(onPressed: () {
            //   Navigator.popAndPushNamed(context, AppRoutes.navigationBarRoute);
            // }, icon: FaIcon(FontAwesomeIcons.faceAngry)),

            const CustomBackButton(
          route: AppRoutes.navigationBarRoute,
        ),
        title: Text(
          "Notification",
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, BoxConstraints contraints) {
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
                    setState(() {});
                    switchNotifi = newValue;
                  })
            ],
          );
        }),
      ),
    );
  }
}
