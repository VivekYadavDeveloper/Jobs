import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import 'widget/otp.vericfication.widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 25.h),
          otpVerificationTextWidget(),
          SizedBox(height: 45.h),
          Form(
            key: _formKey,
            child: OTPTextField(
              controller: otpController,
              length: 4,
              otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Colors.transparent,
                  borderColor: Colors.black,
                  enabledBorderColor: Colors.black),
              width: MediaQuery.of(context).size.width / 1.5,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              spaceBetween: 10,
              fieldWidth: 50.w,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 15.r,
              style:
                  TextStyle(fontSize: 17.sp, color: Colors.blueGrey.shade700),
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
            child: ElevatedButton(onPressed: (){}, child: const Text("SUBMIT"))
          ),
        ],
      ),
    );
  }
}
