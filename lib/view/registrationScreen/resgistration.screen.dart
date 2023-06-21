import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/view/Widgets/custom.back.btn.dart';
import 'package:inductus_jobs/view/registrationScreen/widgets/welcome.text.resgistration.widget.dart';

import '../Widgets/custom.textfield.widget.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CustomBackButton(route: ""),
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
                                      hintText: 'Enter User Name',
                                      validator: (val) => val!.isEmpty
                                          ? 'Enter an Username'
                                          : null,
                                      textInputType: TextInputType.text),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      35.0, 10.0, 35.0, 2.0),
                                  child: CustomTextField.customTextField(
                                      textEditingController:
                                          userEmailController,
                                      hintText: 'User Email',
                                      validator: (val) =>
                                          !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                                  .hasMatch(val!)
                                              ? 'Enter an email'
                                              : null,
                                      textInputType:
                                          TextInputType.emailAddress),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      35.0, 10.0, 35.0, 2.0),
                                  child: CustomTextField.customTextField(
                                      textEditingController:
                                          phoneNumberController,
                                      hintText: 'Enter Phone Number',
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
                                      hintText: 'Enter Password',
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
                                      hintText: 'Confirm Password',
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
                              value: checkValue,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  checkValue = newValue!;
                                });
                              },
                            ),
                            Text(
                              'I agree to the privacy and policy: ',
                              style: TextStyle(fontSize: 17.0.sp),
                            )
                          ]),
                          SizedBox(width: 10.w),
                          SizedBox(
                            height: 30.h,
                            width: 150.w,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(fontSize: 15.sp)),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
