import 'package:flutter/material.dart';

import 'package:inductus_jobs/view/otpVerificationScreen/widget/otp.vericfication.widget.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();
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
        children: <Widget>[
          otpVerificationTextWidget(),
          Form(
            key: _formKey,
            child: Pinput(
              controller: otpController,
              length: 4,
              // width: MediaQuery.of(context).size.width / 1.5,
              // textFieldAlignment: MainAxisAlignment.spaceAround,
              // fieldWidth: 45,
              // fieldStyle: FieldStyle.underline,
              // outlineBorderRadius: 20,
              // style: TextStyle(fontSize: 17.sp),
              onChanged: (pin) {
                otp = pin;
              },
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
          ),
          MaterialButton(
            height: MediaQuery.of(context).size.height * 0.05,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onPressed: () async {},
            color: Colors.purpleAccent,
            child: const Text(
              'SUBMIT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
