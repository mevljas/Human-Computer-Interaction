import 'package:avtek/forms/car_form.dart';
import 'package:avtek/forms/credit_card_form.dart';
import 'package:avtek/forms/customer_form.dart';
import 'package:avtek/forms/general_form.dart';
import 'package:avtek/forms/partial_summary.dart';
import 'package:avtek/forms/payment_type_form.dart';
import 'package:avtek/forms/summary.dart';
import 'package:avtek/menu/menu_bar_wrapper.dart';
import 'package:avtek/pages/order_completed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentStep = 0;
  List<GlobalKey<FormBuilderState>> formKeys = [
    for (var i = 0; i < 7; i += 1) GlobalKey<FormBuilderState>()
  ];

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
            currentStep: _currentStep,
            onStepCancel: () => _currentStep == 0
                ? null
                : setState(() {
                    _currentStep -= 1;
                  }),
            onStepContinue: () {
              setState(() {
                if (formKeys[_currentStep].currentState?.validate() ?? true) {
                  if (_currentStep < _getSteps().length - 1) {
                    _currentStep = _currentStep + 1;
                  } else {
                    _currentStep = 0;
                    // TODO(mevljas): maybe reset?
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuBarWrapper(
                          child: OrderCompletedPage(),
                        ),
                      ),
                    );
                  }
                }
              });
            },
            onStepTapped: (step) => setState(() {
              _currentStep = step;
            }),
            steps: _getSteps(),
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              final isLastStep = _currentStep == _getSteps().length - 1;
              return Row(
                children: <Widget>[
                  ElevatedButton(
                      onPressed: details.onStepContinue,
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      child: Text(isLastStep ? 'Pay' : 'Next')),
                  if (_currentStep != 0)
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Back'),
                    ),
                ],
              );
            },
          )),
    );
  }

  StepState _getStepState(int step) {
    // final stepState = formKeys[step].currentState;
    final currentState = formKeys[_currentStep].currentState;
    if (_currentStep > step) {
      return StepState.complete;
    } else if (_currentStep == step) {
      return StepState.editing;
    } else if (step == _currentStep + 1 &&
        (currentState?.validate() ?? false)) {
      return StepState.indexed;
    } else {
      // return StepState.indexed;
      return StepState.disabled;
    }
  }

  List<Step> _getSteps() {
    return <Step>[
      // Step(
      //   state: getStepState(0),
      //   isActive: currentStep == 0,
      //   title: const Text("Account Info"),
      //   content: const CompleteForm(),
      // ),
      Step(
        state: _getStepState(0),
        isActive: _currentStep == 0,
        title: const Text("General Info"),
        content: GeneralForm(formKey: formKeys[0]),
      ),
      Step(
        state: _getStepState(1),
        isActive: _currentStep == 1,
        title: const Text("Car Info"),
        content: CarForm(formKey: formKeys[1]),
      ),
      Step(
        state: _getStepState(2),
        isActive: _currentStep == 2,
        title: const Text("Partial Summary"),
        content: const PartialSummary(),
      ),
      Step(
        state: _getStepState(3),
        isActive: _currentStep == 3,
        title: const Text("Customer info"),
        content: CustomerForm(formKey: formKeys[3]),
      ),
      Step(
        state: _getStepState(4),
        isActive: _currentStep == 4,
        title: const Text("Payment type"),
        content: PaymentTypeForm(formKey: formKeys[4]),
      ),
      Step(
        state: _getStepState(5),
        isActive: _currentStep == 5,
        title: const Text("Credit card info"),
        content: CreditCardForm(formKey: formKeys[5]),
      ),
      Step(
        state: _getStepState(6),
        isActive: _currentStep == 6,
        title: const Text("Summary"),
        content: const Summary(),
      ),
    ];
  }
}
