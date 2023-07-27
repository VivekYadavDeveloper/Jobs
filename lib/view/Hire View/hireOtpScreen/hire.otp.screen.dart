import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';
import 'package:inductus_jobs/app/routes/app.routes.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import 'widget/hire.otp.screen.widget.dart';

class HireOtpVerificationScreen extends StatefulWidget {
  const HireOtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<HireOtpVerificationScreen> createState() => _HireOtpVerificationScreenState();
}

class _HireOtpVerificationScreenState extends State<HireOtpVerificationScreen> {
  OtpFieldController otpController = OtpFieldController();
  final _formKey = GlobalKey<FormState>();
  var otp = "";

  @override
  // void initState() {
  //   final userTokenVerified = Provider.of<UserNotifier>(context, listen: false);
  //   ReadCache.getString(key: AppKeys.userVerifiedToken).then(
  //         (token) =>
  //     {userTokenVerified.getUserData(context: context, token: token)},
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 25.h),
          hireOtpVerificationTextWidget(),
          SizedBox(height: 45.h),
          Form(
            key: _formKey,
            child: OTPTextField(
              controller: otpController,
              length: 4,
              otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Colors.transparent,
                  borderColor: AppColors.textFieldFillColor,
                  enabledBorderColor: AppColors.activeColor),
              width: MediaQuery.of(context).size.width / 1.5,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              spaceBetween: 10,
              fieldWidth: 50.w,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 15.r,
              style: TextStyle(fontSize: 17.sp, color: AppColors.whiteColor),
              onChanged: (pin) {
                otp = pin;
              },
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
          ),
          SizedBox(height: 25.h),
          Center(
            child: SizedBox(
              height: 50.h,
              width: 150.w,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.activeColor)),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.hireLoginRoute, (route) => false);
                },
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
