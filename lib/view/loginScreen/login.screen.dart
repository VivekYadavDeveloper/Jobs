import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';
import 'package:inductus_jobs/view/Widgets/custom.textfield.widget.dart';
import 'package:inductus_jobs/view/loginScreen/Widgets/login.screen.widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            welcomeTextLogin(),
            SizedBox(height: 20.h),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                            child: CustomTextField.customTextField(
                              textEditingController: emailController,
                              textInputType: TextInputType.text,
                              helperText: "Email",
                              validator: (val) =>
                                  !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                          .hasMatch(val!)
                                      ? 'Enter an email/number'
                                      : null,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                            child: CustomTextField.customTextField(
                              textEditingController: passwordController,
                              textInputType: TextInputType.text,
                              helperText: "Password",
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter a password' : null,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            height: 40.h,
                            width: 150.w,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.activeColor)),
                                onPressed: () {},
                                child: Text(
                                  "LOGIN",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.bold)),
                                )),
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
