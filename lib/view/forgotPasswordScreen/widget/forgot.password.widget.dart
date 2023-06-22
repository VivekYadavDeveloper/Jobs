import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inductus_jobs/view/Widgets/custom.back.btn.dart';

Widget forgotPasswordTextWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const CustomBackButton(route: "route"),
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            text: 'Hey Forgot Your Password ! 😲 ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 35.0.sp,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            text: 'Enter Your Register Email To Receive The OTP',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w400,
              fontSize: 25.0.sp,
            ),
          ),
        ),
      )
    ],
  );
}
