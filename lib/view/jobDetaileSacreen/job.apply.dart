import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/view/Widgets/custom.textfield.widget.dart';

import '../../app/app.color.constant.dart';

class JobApplyScreen extends StatelessWidget {
  JobApplyScreen({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController coverLetterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Apply Job",
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              CustomTextField.customTextField(
                  textEditingController: fullNameController,
                  textInputType: TextInputType.text,
                  helperText: "Full Name"),
              SizedBox(height: 10.h),
              CustomTextField.customTextField(
                  textEditingController: fullNameController,
                  textInputType: TextInputType.text,
                  helperText: "Email"),
              SizedBox(height: 10.h),
              Container(
                height: 50.h,
                width: 250.0.w,
                decoration: BoxDecoration(
                  color: AppColors.activeColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Upload Your CV",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                      FaIcon(
                        FontAwesomeIcons.filePdf,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 300,
                child: TextFormField(
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: AppColors.whiteColor),
                  // onChanged: onChange,
                  controller: coverLetterController,
                  // validator: validator,
                  decoration: InputDecoration(
                    helperText: "Cover Letter",
                    focusColor: AppColors.textFieldFillColor,
                    hoverColor: AppColors.textFieldFillColor,
                    fillColor: AppColors.textFieldFillColor,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    helperStyle:
                        TextStyle(color: AppColors.whiteColor, fontSize: 15.sp),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide:
                          BorderSide(color: AppColors.activeColor, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: AppColors.activeColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 50.h,
                  width: 100.w,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.activeColor)),
                      onPressed: () {},
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      )))
            ],
          ),
        );
      }),
    );
  }
}
