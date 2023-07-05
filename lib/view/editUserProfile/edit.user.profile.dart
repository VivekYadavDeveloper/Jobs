import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  int _currentIndex = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: switchStepper,
      //   child: const FaIcon(FontAwesomeIcons.arrowRight),
      // ),
      appBar: AppBar(
        // leading: Center(
        //   child: InkWell(
        //       onTap: () {
        //         Navigator.pop(context);
        //       },
        //       child: FaIcon(FontAwesomeIcons.arrowLeft)),
        // ),
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
          child: Expanded(
            child: Theme(
              data: ThemeData(
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
                      TextButton(
                        onPressed: continued,
                        child: const Text(
                          'NEXT',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      TextButton(
                        onPressed: cancel,
                        child: const Text(
                          'EXIT',
                          style: TextStyle(color: Colors.blue),
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
                physics: const ScrollPhysics(),
                steps: <Step>[
                  //**** Basic Information
                  Step(
                    title: Text(
                      "Basic Detail",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CustomTextField.customTextField(
                          helperText: "Full Name",
                          textEditingController: userName,
                          textInputType: TextInputType.name,
                        ),
                        CustomTextField.customTextField(
                          helperText: "Gender",
                          textEditingController: selectUserGender,
                          textInputType: TextInputType.name,
                        ),
                        CustomTextField.customTextField(
                          helperText: "DOB",
                          textEditingController: dateOfBirth,
                          textInputType: TextInputType.datetime,
                        ),
                        CustomTextField.customTextField(
                          helperText: "Location",
                          textEditingController: locationSelection,
                          textInputType: TextInputType.name,
                        ),
                      ],
                    ),
                    isActive: _currentIndex >= 0,
                    state: _currentIndex >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  //**** Bio Section
                  Step(
                    title: Text(
                      "Bio",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    content: Column(
                      children: <Widget>[
                        CustomTextField.customTextField(
                            textEditingController: userBio,
                            textInputType: TextInputType.text,
                            helperText: "Bio (Max 500 Word)"),
                      ],
                    ),
                    isActive: _currentIndex >= 0,
                    state: _currentIndex >= 2
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
    _currentIndex < 2 ? setState(() => _currentIndex += 1) : null;
  }

  cancel() {
    _currentIndex > 0 ? setState(() => _currentIndex -= 1) : null;
  }
}
