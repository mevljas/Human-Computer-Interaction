import 'package:avtek/forms/car_form.dart';
import 'package:avtek/forms/general_form.dart';
import 'package:avtek/forms/partial_summary.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Avtek",
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepCancel: () => currentStep == 0
                ? null
                : setState(() {
                    currentStep -= 1;
                  }),
            onStepContinue: () {
              bool isLastStep = (currentStep == getSteps().length - 1);
              if (isLastStep) {
                //Do something with this information
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepTapped: (step) => setState(() {
              currentStep = step;
            }),
            steps: getSteps(),
          )),
    );
  }

  StepState getStepState(int step) {
    if (currentStep > step) {
      return StepState.complete;
    } else if (currentStep == step) {
      return StepState.editing;
    } else {
      return StepState.indexed;
      // return StepState.disabled;
    }
  }

  List<Step> getSteps() {
    return <Step>[
      // Step(
      //   state: getStepState(0),
      //   isActive: currentStep == 0,
      //   title: const Text("Account Info"),
      //   content: const CompleteForm(),
      // ),
      Step(
        state: getStepState(0),
        isActive: currentStep == 0,
        title: const Text("General Info"),
        content: const GeneralForm(),
      ),
      Step(
        state: getStepState(1),
        isActive: currentStep == 1,
        title: const Text("Car Info"),
        content: const CarForm(),
      ),
      Step(
        state: getStepState(2),
        isActive: currentStep == 2,
        title: const Text("Partial Summary"),
        content: const PartialSummary(),
      ),
    ];
  }
}
