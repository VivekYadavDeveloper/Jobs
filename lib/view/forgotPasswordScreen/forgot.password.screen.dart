import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/view/Widgets/custom.textfield.widget.dart';
import 'package:inductus_jobs/view/forgotPasswordScreen/widget/forgot.password.widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController userForgotPassEmailController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            forgotPasswordTextWidget(),
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
                          hintText: "Enter Email",
                          validator: (val) =>
                              !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                      .hasMatch(val!)
                                  ? 'Enter an email'
                                  : null,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        height: 30.h,
                        width: 150.w,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "OTP Send",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(fontSize: 15.sp)),
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
