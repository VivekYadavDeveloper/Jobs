import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';

import '../Widgets/custom.back.btn.dart';
import '../Widgets/custom.textfield.widget.dart';
import 'widgets/welcome.text.resgistration.widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController userEmailController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController userPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CustomBackButton(route: "/loginScreen"),
                  welcomeTextRegistration(),
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
                                padding: const EdgeInsets.fromLTRB(
                                    35.0, 10.0, 35.0, 2.0),
                                child: CustomTextField.customTextField(
                                    textEditingController: userNameController,
                                    helperText: 'Enter User Name',
                                    validator: (val) => val!.isEmpty
                                        ? 'Enter an Username'
                                        : null,
                                    textInputType: TextInputType.text),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    35.0, 10.0, 35.0, 2.0),
                                child: CustomTextField.customTextField(
                                    textEditingController: userEmailController,
                                    helperText: 'User Email',
                                    validator: (val) =>
                                        !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                                .hasMatch(val!)
                                            ? 'Enter an email'
                                            : null,
                                    textInputType: TextInputType.emailAddress),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    35.0, 10.0, 35.0, 2.0),
                                child: CustomTextField.customTextField(
                                    textEditingController:
                                        phoneNumberController,
                                    helperText: 'Enter Phone Number',
                                    textInputType: TextInputType.phone,
                                    validator: (value) {
                                      String patttern =
                                          r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                      RegExp regExp = RegExp(patttern);
                                      if (value?.length == 0) {
                                        return 'Please enter mobile number';
                                      } else if (!regExp.hasMatch(value!)) {
                                        return 'Please enter valid mobile number';
                                      }
                                      return null;
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    35.0, 10.0, 35.0, 2.0),
                                child: CustomTextField.customTextField(
                                    textEditingController: userPassController,
                                    helperText: 'Enter Password',
                                    validator: (val) => val!.isEmpty
                                        ? 'Please Fill Password'
                                        : null,
                                    textInputType: TextInputType.text),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    35.0, 10.0, 35.0, 2.0),
                                child: CustomTextField.customTextField(
                                    textEditingController: userPassController,
                                    helperText: 'Confirm Password',
                                    validator: (val) => val!.isEmpty
                                        ? 'Please Fill Confirm Password'
                                        : null,
                                    textInputType: TextInputType.text),
                              ),
                            ],
                          ),
                        ),
                        /** Checkbox Widget **/
                        Row(children: <Widget>[
                          Checkbox(
                            activeColor: AppColors.activeColor,
                            hoverColor: AppColors.whiteColor,
                            value: checkValue,
                            onChanged: (bool? newValue) {
                              setState(() {
                                checkValue = newValue!;
                              });
                            },
                          ),
                          Text(
                            'I agree to the privacy and policy: ',
                            style: TextStyle(
                                fontSize: 17.0.sp, color: AppColors.whiteColor),
                          )
                        ]),
                        SizedBox(width: 10.w),
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
                              "SIGN IN",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
