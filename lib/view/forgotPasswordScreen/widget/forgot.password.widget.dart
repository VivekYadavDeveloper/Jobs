import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';
import 'package:inductus_jobs/app/routes/app.routes.dart';
import 'package:inductus_jobs/view/Widgets/custom.back.btn.dart';

Widget forgotPasswordTextWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CustomBackButton(route: "/loginScreen"),
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            text: 'Hey Forgot Your Password!😲 ',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w900,
              fontSize: 30.0.sp,
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
              color: AppColors.activeColor,
              fontWeight: FontWeight.w400,
              fontSize: 25.0.sp,
            ),
          ),
        ),
      )
    ],
  );
}
