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
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //**** Info Section ****//
                  Container(
                    height: 300.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      color: AppColors.textFieldFillColor,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: ListTile(
                      title: Column(
                        children: <Widget>[
                          const CircleAvatar(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    color: AppColors.activeColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12))),
                                child: Center(
                                  child: Text(
                                    "On-Site",
                                    style: TextStyle(
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    color: AppColors.activeColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12))),
                                child: Center(
                                  child: Text(
                                    "Full-Time",
                                    style: TextStyle(
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Posted On 6 Day Ago",
                            style: TextStyle(color: AppColors.whiteColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  //**** Description Section ****//
                  SizedBox(height: 10.h),
                  Text(
                    "Job Description",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design Lorem ipsum is typically a corrupted version of De finibus bonorum et malorum, a 1st-century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin. The first two words themselves are a truncation of 'dolorem ipsum' ('pain itself').Versions of the Lorem ipsum text have been used in typesetting at least since the 1960s, when it was popularized by advertisements for Letraset transfer sheets.[1] Lorem ipsum was introduced to the digital world in the mid-1980s, when Aldus employed it in graphic and word-processing templates for its desktop publishing program PageMaker. Other popular word processors, including Pages and Microsoft Word, have since adopted Lorem ipsum,[2] as have many LaTeX packages, web content managers such as Joomla! and WordPress, and CSS libraries such as Semantic UI.",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 40.h,
                    width: 150.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              AppColors.activeColor)),
                      onPressed: () {},
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
