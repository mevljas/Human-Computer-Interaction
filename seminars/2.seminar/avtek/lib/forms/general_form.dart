import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class GeneralForm extends StatefulWidget {
  const GeneralForm({Key? key, required this.formKey}) : super(key: key);

  final formKey;

  @override
  State<GeneralForm> createState() {
    return _GeneralFormState();
  }
}

class _GeneralFormState extends State<GeneralForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  bool _pickupLocationHasError = false;
  bool _dropoffLocationHasError = false;
  final bool _pickupTimeHasError = false;
  bool _returnTimeHasError = false;

  var locationOptions = [
    'Ljubljana',
    'Maribor',
    'Celje',
    'Kranj',
    'Velenje',
    'Koper',
    'Novo Mesto',
    'Murska Sobota',
    'Jesenice',
    'Portorož',
    'letališče Brnik',
    'letališče Maribor'
  ];

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
                FormBuilderDateTimePicker(
                  name: 'pickup_time',
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025, 1, 1),
                  inputType: InputType.both,
                  decoration: InputDecoration(
                    labelText: 'Pickup Time',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        widget.formKey.currentState!.fields['pickup_time']
                            ?.didChange(null);
                      },
                    ),
                  ),
                  initialTime: const TimeOfDay(hour: 8, minute: 0),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  // locale: const Locale.fromSubtags(languageCode: 'fr'),
                ),
                const SizedBox(height: 20),
                FormBuilderDateTimePicker(
                  name: 'return_time',
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025, 1, 1),
                  inputType: InputType.both,
                  decoration: InputDecoration(
                    labelText: 'Return Time',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        widget.formKey.currentState!.fields['return_time']
                            ?.didChange(null);
                      },
                    ),
                  ),
                  initialTime: const TimeOfDay(hour: 8, minute: 0),
                  onChanged: (val) {
                    setState(() {
                      _returnTimeHasError = !(widget
                              .formKey.currentState?.fields['return_time']
                              ?.validate() ??
                          false);
                    });
                  },
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  // locale: const Locale.fromSubtags(languageCode: 'fr'),
                ),
                const SizedBox(height: 20),
                FormBuilderDropdown<String>(
                  name: 'pickup_location',
                  decoration: InputDecoration(
                    labelText: 'Pickup location',
                    suffix: _pickupLocationHasError
                        ? const Icon(Icons.error)
                        : const Icon(Icons.check),
                    hintText: 'Select your pickup location',
                  ),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  items: locationOptions
                      .map((location) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: location,
                            child: Text(location),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _pickupLocationHasError = !(widget
                              .formKey.currentState?.fields['pickup_location']
                              ?.validate() ??
                          false);
                    });
                  },
                  valueTransformer: (val) => val?.toString(),
                ),
                const SizedBox(height: 20),
                FormBuilderDropdown<String>(
                  name: 'drop_off_location',
                  decoration: InputDecoration(
                    labelText: 'Drop off location',
                    suffix: _dropoffLocationHasError
                        ? const Icon(Icons.error)
                        : const Icon(Icons.check),
                    hintText: 'Select your drop off location',
                  ),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  items: locationOptions
                      .map((location) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: location,
                            child: Text(location),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _dropoffLocationHasError = !(widget
                              .formKey.currentState?.fields['drop_off_location']
                              ?.validate() ??
                          false);
                    });
                  },
                  valueTransformer: (val) => val?.toString(),
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
          //           if (widget.formKey.currentState?.saveAndValidate() ??
          //               false) {
          //             debugPrint(widget.formKey.currentState?.value.toString());
          //           } else {
          //             debugPrint(widget.formKey.currentState?.value.toString());
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
          //           widget.formKey.currentState?.reset();
          //         },
          //         // color: Theme.of(context).colorScheme.secondary,
          //         child: Text(
          //           'Reset',
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
