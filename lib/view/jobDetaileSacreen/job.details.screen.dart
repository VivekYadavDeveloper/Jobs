import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/app.color.constant.dart';

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({super.key});

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "View Details",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: AppColors.whiteColor)),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 400.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                    color: AppColors.textFieldFillColor,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ListTile(
                    title: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(""),
                          radius: 50,
                        ),
                        Text(
                          "Flutter Developer",
                          style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor),
                        ),
                        Text(
                          "Inductucs Limited.",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Noida Sec 2",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "1 Yr Experience ",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor),
                        ),
                        Text(
                          "Rs 10L-12L Per Year",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor),
                        ),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 20,
                                height: 30,
                                child: Text("On-Site",style: TextStyle(color:AppColors.activeColor ),),
                              ),
                              SizedBox(
                                width: 20,
                                height: 30,
                                child: Text("Full-Time"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
