import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';

Widget welcomeTextRegistration() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Center(
        child: Text(
          "Create Account",
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
            fontSize: 25.sp,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          )),
        ),
      )
    ],
  );
}
