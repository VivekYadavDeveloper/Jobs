import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget welcomeTextLogin() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0,0.0, 35.0, 2.0),
        child: Center(
          child: Text("Get Hired...",
              textAlign: TextAlign.center,
              style: GoogleFonts.solitreo(
                textStyle: TextStyle(
                  color: Colors.lightBlue.shade400,
                  fontSize: 25.sp,
                ),
              )),
        ),
      ),
      SizedBox(
        height: 100,
        child: Image.asset("assets/images/logo.png"),
      ),
      Text(
        "Inductus Jobs",
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold)),
      )
    ],
  );
}
