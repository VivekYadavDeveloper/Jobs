import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';

Widget otpVerificationTextWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      RichText(
        text: TextSpan(
          text: 'Enter Your OTP ',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 28.0.sp,
          ),
        ),
      ),
    ],
  );
}
