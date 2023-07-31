import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/view/Widgets/custom.back.btn.dart';

import '../../../app/app.color.constant.dart';
import '../../Widgets/custom.textfield.widget.dart';

class HireJobFormScreen extends StatefulWidget {
  HireJobFormScreen({super.key});

  @override
  State<HireJobFormScreen> createState() => _HireJobFormScreenState();
}

class _HireJobFormScreenState extends State<HireJobFormScreen> {
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController jobDescriptionController =
      TextEditingController();
  final TextEditingController jobEmailController = TextEditingController();
  final TextEditingController jobUserNameController = TextEditingController();
  final TextEditingController jobSectorController = TextEditingController();
  final TextEditingController jobPositionController = TextEditingController();
  final TextEditingController jobTypeController = TextEditingController();
  final TextEditingController jobApplyTypeController = TextEditingController();
  final TextEditingController jobSalaryController = TextEditingController();
  final TextEditingController jobDesignationController =
      TextEditingController();
  final TextEditingController jobExperienceController = TextEditingController();
  final TextEditingController jobIndustryController = TextEditingController();
  final TextEditingController jobQualificationController =
      TextEditingController();
  final TextEditingController jobContactController = TextEditingController();
  final TextEditingController jobCountryController = TextEditingController();
  final TextEditingController jobStateController = TextEditingController();
  final TextEditingController jobCityController = TextEditingController();
  final TextEditingController jobPostalCodeController = TextEditingController();
  final TextEditingController jobFullAddressController =
      TextEditingController();
  int _currentIndex = 0;
  StepperType stepperType = StepperType.horizontal;
  final _stepperController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post New Job",
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
                          _currentIndex == 1 ? "DONE" : "NEXT",
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
                      "JOB DETAIL",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Job Details",
                          style: TextStyle(
                              fontSize: 20.sp, color: AppColors.whiteColor),
                        ),
                        CustomTextField.customTextField(
                          helperText: "Job Title",
                          textEditingController: jobTitleController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Job Description",
                          textEditingController: jobDescriptionController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Email Address",
                          textEditingController: jobEmailController,
                          textInputType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "User Name",
                          textEditingController: jobUserNameController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Job Sector",
                          textEditingController: jobSectorController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Job Type",
                          textEditingController: jobTypeController,
                          textInputType: TextInputType.name,
                        ),

                        //**** REQUIRED SECTION ****//
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        Text(
                          "Required Skills*",
                          style: TextStyle(
                              fontSize: 18.sp, color: AppColors.whiteColor),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 35),
                        CustomTextField.customTextField(
                          helperText: "Job Apply Type",
                          textEditingController: jobApplyTypeController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Salary",
                          textEditingController: jobSalaryController,
                          textInputType: TextInputType.number,
                        ),
                        //**** OTHER INFORMATION SECTION ****//
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        Text(
                          "Other Information",
                          style: TextStyle(
                              fontSize: 18.sp, color: AppColors.whiteColor),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 35),
                        CustomTextField.customTextField(
                          helperText: "Designation",
                          textEditingController: jobDesignationController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Experience*",
                          textEditingController: jobExperienceController,
                          textInputType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Industry",
                          textEditingController: jobIndustryController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Qualification",
                          textEditingController: jobQualificationController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Position",
                          textEditingController: jobPositionController,
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Contact Number",
                          textEditingController: jobContactController,
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        Text(
                          "Address / Location",
                          style: TextStyle(
                              fontSize: 18.sp, color: AppColors.whiteColor),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 35),

                        CustomTextField.customTextField(
                          helperText: "Country",
                          textEditingController: jobCountryController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "State",
                          textEditingController: jobStateController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "City",
                          textEditingController: jobCityController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Postal Code",
                          textEditingController: jobPostalCodeController,
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Full Address",
                          textEditingController: jobFullAddressController,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        CustomTextField.customTextField(
                          helperText: "Job Sector",
                          textEditingController: jobSectorController,
                          textInputType: TextInputType.name,
                        ),
                      ],
                    ),
                    isActive: _currentIndex >= 0,
                    state: _currentIndex >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  //**** Confirmation Section ****//
                  Step(
                    title: Text(
                      "CONFIRMATION",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 300.h,
                          width: 500.w,
                          child: const Card(
                            color: Colors.transparent,
                            surfaceTintColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentIndex >= 0,
                    state: _currentIndex >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
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
    _currentIndex < 1 ? setState(() => _currentIndex += 1) : null;
  }

  cancel() {
    _currentIndex > 0 ? setState(() => _currentIndex -= 1) : null;
  }
}
