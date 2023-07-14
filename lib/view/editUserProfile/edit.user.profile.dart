import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/view/Widgets/custom.textfield.widget.dart';
import '../../app/app.color.constant.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({super.key});

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController selectUserGender = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController locationSelection = TextEditingController();
  final TextEditingController userBio = TextEditingController();
  final TextEditingController userQualification = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  int _currentIndex = 0;
  StepperType stepperType = StepperType.horizontal;
  final _stepperController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: switchStepper,
      //   child: const FaIcon(FontAwesomeIcons.arrowRight),
      // ),
      appBar: AppBar(

        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: AppColors.whiteColor)),
        ),
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Theme(
              data: ThemeData(
                useMaterial3: true,
                canvasColor: AppColors.primaryColor,
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: AppColors.activeColor,
                      background: Colors.red,
                      secondary: Colors.green,
                    ),
              ),
              child: Stepper(
                controlsBuilder: (BuildContext context, _) {
                  return Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: continued,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.activeColor,
                          ),
                        ),
                        child: Text(
                          _currentIndex == 2 ? "DONE" : "NEXT",
                          // continued() == true ? "NEXT":"SUBMIT" ,
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ),
                      TextButton(
                        onPressed: cancel,
                        child: Text(
                          'EXIT',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ),
                    ],
                  );
                },
                type: stepperType,
                onStepTapped: (step) => tapped(step),
                currentStep: _currentIndex,
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  //**** Basic Information
                  Step(
                    title: Text(
                      "Basic Detail",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "BASIC INFO",
                          style: TextStyle(
                              fontSize: 20.sp, color: AppColors.whiteColor),
                        ),
                        CustomTextField.customTextField(
                          helperText: "Full Name",
                          textEditingController: userName,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Gender",
                          textEditingController: selectUserGender,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "DOB",
                          textEditingController: dateOfBirth,
                          textInputType: TextInputType.datetime,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Location",
                          textEditingController: locationSelection,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                      ],
                    ),
                    isActive: _currentIndex >= 0,
                    state: _currentIndex >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  //**** Bio Section ****//
                  Step(
                    title: Text(
                      "Bio",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "BIO",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20.sp, color: AppColors.whiteColor),
                        ),
                        CustomTextField.customTextField(
                            textEditingController: userBio,
                            textInputType: TextInputType.text,
                            helperText: "Bio (Max 500 Word)"),
                        SizedBox(height: 10.h),

                        //**** Education Section ****//
                        Text(
                          "EDUCATION",
                          style: TextStyle(
                              fontSize: 20.sp, color: AppColors.whiteColor),
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField.customTextField(
                            textEditingController: userQualification,
                            textInputType: TextInputType.text,
                            helperText: "Education Qualification"),
                        SizedBox(height: 10.h),
                        CustomTextField.customTextField(
                            textEditingController: userQualification,
                            textInputType: TextInputType.text,
                            helperText: "Course"),
                        SizedBox(height: 10.h),
                        CustomTextField.customTextField(
                            textEditingController: userQualification,
                            textInputType: TextInputType.text,
                            helperText: "School"),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: CustomTextField.customTextField(
                                  textEditingController: fromController,
                                  textInputType: TextInputType.datetime,
                                  helperText: "From"),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                                child: CustomTextField.customTextField(
                                    textEditingController: toController,
                                    textInputType: TextInputType.datetime,
                                    helperText: "To"))
                          ],
                        ),
                      ],
                    ),
                    isActive: _currentIndex >= 0,
                    state: _currentIndex >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  //**** Contact Section *****//
                  Step(
                    title: Text(
                      "Contact",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "CONTACT",
                          style: TextStyle(
                              fontSize: 20.sp, color: AppColors.whiteColor),
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField.customTextField(
                            textEditingController: userQualification,
                            textInputType: TextInputType.phone,
                            helperText: "Mobile No"),
                        SizedBox(height: 10.h),
                        CustomTextField.customTextField(
                            textEditingController: userQualification,
                            textInputType: TextInputType.emailAddress,
                            helperText: "Email"),
                        SizedBox(height: 10.h),
                        Container(
                          height: 50.h,
                          child: Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "SAVE PROFILE",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColors.primaryColor),
                                )),
                          ),
                        )
                      ],
                    ),
                    isActive: _currentIndex >= 0,
                    state: _currentIndex >= 3
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  //   //  **** Key Skills And Language
                  //   Step(
                  //     title: Text(
                  //       "Skill",
                  //       style: TextStyle(color: AppColors.whiteColor),
                  //     ),
                  //     content: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Text(
                  //           "Skill And Language",
                  //           textAlign: TextAlign.start,
                  //           style: TextStyle(
                  //               fontSize: 25.sp, color: AppColors.whiteColor),
                  //         ),
                  //         CustomTextField.customTextField(
                  //             textEditingController: userBio,
                  //             textInputType: TextInputType.text,
                  //             helperText: "Skills"),
                  //       ],
                  //     ),
                  //     isActive: _currentIndex >= 0,
                  //     state: _currentIndex >= 4
                  //         ? StepState.complete
                  //         : StepState.disabled,
                  //   ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  switchStepper() {
    setState(() => stepperType == StepperType.horizontal
        ? stepperType = StepperType.vertical
        : stepperType = StepperType.horizontal);
  }

  tapped(int step) {
    setState(() {
      _currentIndex = step;
    });
  }

  continued() {
    _currentIndex < 2 ? setState(() => _currentIndex += 1) : null;
  }

  cancel() {
    _currentIndex > 0 ? setState(() => _currentIndex -= 1) : null;
  }
}
