import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormBuilderState> formKey;

  @override
  State<CreditCardForm> createState() {
    return _CreditCardFormState();
  }
}

class _CreditCardFormState extends State<CreditCardForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  bool _cardNumberHasError = false;
  bool _expirationDateHasError = false;
  bool _ccvHasError = false;

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormBuilder(
            key: widget.formKey,
            // enabled: false,
            onChanged: () {
              widget.formKey.currentState!.save();
              debugPrint(widget.formKey.currentState!.value.toString());
            },
            autovalidateMode: AutovalidateMode.disabled,
            initialValue: const {
              'movie_rating': 5,
              'best_language': 'Dart',
              'age': '13',
              'gender': 'Male',
              'languages_filter': ['Dart']
            },
            skipDisabled: true,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.disabled,
                  name: 'number',
                  decoration: InputDecoration(
                    labelText: 'Card number',
                    suffixIcon: _cardNumberHasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _cardNumberHasError = !(widget
                              .formKey.currentState?.fields['number']
                              ?.validate() ??
                          false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.creditCard(),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                FormBuilderDateTimePicker(
                  name: 'expiration_date',
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  format: DateFormat('MM/yyyy'),
                  lastDate: DateTime(2040, 1, 1),
                  inputType: InputType.date,
                  decoration: InputDecoration(
                    labelText: 'Expiration date',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        widget.formKey.currentState!.fields['expiration_date']
                            ?.didChange(null);
                      },
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _expirationDateHasError = !(widget
                              .formKey.currentState?.fields['expiration_date']
                              ?.validate() ??
                          false);
                    });
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  // locale: const Locale.fromSubtags(languageCode: 'fr'),
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.disabled,
                  name: 'ccv',
                  decoration: InputDecoration(
                    labelText: 'CCV',
                    suffixIcon: _ccvHasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _ccvHasError = !(widget
                              .formKey.currentState?.fields['ccv']
                              ?.validate() ??
                          false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.equalLength(3),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(height: 50),
          // Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: ElevatedButton(
          //         onPressed: () {
          //           if (_formKey.currentState?.saveAndValidate() ?? false) {
          //             debugPrint(_formKey.currentState?.value.toString());
          //           } else {
          //             debugPrint(_formKey.currentState?.value.toString());
          //             debugPrint('validation failed');
          //           }
          //         },
          //         child: const Text(
          //           'Submit',
          //           style: TextStyle(color: Colors.black),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: 20),
          //     Expanded(
          //       child: OutlinedButton(
          //         onPressed: () {
          //           _formKey.currentState?.reset();
          //         },
          //         // color: Theme.of(context).colorScheme.secondary,
          //         child: Text(
          //           'Reset',
          //           style: TextStyle(
          //               color: Theme.of(context).colorScheme.secondary),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: OutlinedButton(
          //         onPressed: () {
          //           Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const MenuBarWrapper(
          //                 child: SummaryPage(),
          //               ),
          //             ),
          //           );
          //         },
          //         // color: Theme.of(context).colorScheme.secondary,
          //         child: Text(
          //           'Finish',
          //           style: TextStyle(
          //               color: Theme.of(context).colorScheme.secondary),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
