import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';
import 'package:inductus_jobs/view/Hire%20View/hireLoginScreen/widgets/hire.welcome.custom.widget.dart';

import 'package:inductus_jobs/view/Widgets/custom.textfield.widget.dart';
import 'package:inductus_jobs/view/loginScreen/Widgets/login.screen.widget.dart';

import '../../../app/routes/app.routes.dart';
import '../../Widgets/custom.back.btn.dart';
import '../hireProfileScreen/hire.job.form.screen.dart';
import '../hireProfileScreen/hire.job.form.screen.dart';

class HireLoginScreen extends StatelessWidget {
  HireLoginScreen({super.key});

  final TextEditingController hireemailController = TextEditingController();
  final TextEditingController hirepasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: const CustomBackButton(route: '/loginScreen'),
      ),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              hireWelcomeTextLogin(),
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
                              textEditingController: hireemailController,
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
                              textEditingController: hirepasswordController,
                              textInputType: TextInputType.text,
                              helperText: "Password",
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter a password' : null,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        AppRoutes.hireForgotPassRoute,
                                        (route) => false);
                                  },
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),

                          TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    AppRoutes.hireRegistrationRoute,
                                    (route) => false);
                              },
                              child: Text(
                                "Register Here !",
                                style: TextStyle(
                                    color: AppColors.activeColor,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 40.h,
                            width: 150.w,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.activeColor)),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    AppRoutes.hireJobPostFormRoute,
                                    (route) => false);
                              },
                              child: Text(
                                "LOGIN",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 15.sp,
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          // SizedBox(height: 10.h),
                          // TextButton(
                          //   onPressed: () {},
                          //   child: Text(
                          //     "Let's Hired !",
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15.sp,
                          //         color: AppColors.activeColor),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
