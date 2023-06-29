import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: AppColors.activeColor,
            )),
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Profile",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(color: AppColors.whiteColor)),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // **** Profile Image Section //
                    Container(
                      height: MediaQuery.of(context).size.height / 5.5.h,
                      width: MediaQuery.of(context).size.width / 3.3.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.fieldColor,
                        image: const DecorationImage(
                          image: AssetImage("assetName"),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.plus),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 15.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Vivek Yadav",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        Text(
                          "Flutter Developer",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        Text(
                          "Noida Sector 2",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.fieldColor)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const FaIcon(FontAwesomeIcons.penToSquare),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 25.w),
                              Text(
                                "Update Profile",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 25.h),
                Container(
                  height: MediaQuery.of(context).size.height / 12.5.h,
                  width: MediaQuery.of(context).size.width / 1.2.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.fieldColor,
                    image: const DecorationImage(
                      image: AssetImage("assetName"),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Upload CV",
                          style: GoogleFonts.roboto(
                              textStyle:
                                  TextStyle(color: AppColors.whiteColor)),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.filePdf,
                            color: AppColors.activeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
