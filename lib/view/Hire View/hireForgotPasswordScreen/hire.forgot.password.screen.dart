import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';
import 'package:inductus_jobs/app/routes/app.routes.dart';
import 'package:inductus_jobs/view/Widgets/custom.textfield.widget.dart';

import 'widget/hire.forgotpassword.welcome.widget.dart';

class HireForgotPasswordScreen extends StatelessWidget {
  HireForgotPasswordScreen({super.key});

  final TextEditingController userForgotPassEmailController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            hireForgotPasswordTextWidget(),
            SizedBox(height: 10.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                        child: CustomTextField.customTextField(
                          textEditingController: userForgotPassEmailController,
                          textInputType: TextInputType.emailAddress,
                          helperText: "Enter Email",
                          validator: (val) =>
                              !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                      .hasMatch(val!)
                                  ? 'Enter an email'
                                  : null,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 40.h,
                        width: 150.w,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.activeColor)),
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  AppRoutes.hireOtpRoute, (route) => false);
                            },
                            child: Text(
                              "SUBMIT",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold)),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      }),
    ));
  }
}
