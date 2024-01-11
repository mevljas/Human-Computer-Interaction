import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CarForm extends StatefulWidget {
  const CarForm({Key? key, required this.formKey}) : super(key: key);

  @override
  State<CarForm> createState() {
    return _CarFormState();
  }

  final GlobalKey<FormBuilderState> formKey;
}

class _CarFormState extends State<CarForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  bool _carSizeHasError = false;
  bool _transmissionTypeHasError = false;
  bool _engineTypeHasError = false;
  bool _carHasError = false;

  final carSizes = ['Small', 'Medium', 'Large'];

  final smallCars = [
    'VW Up',
    'Renault Twingo',
    'Fiat 500',
    'Toyota Aygo',
    'Hyundai i10',
    'Kia Picanto',
    'Citroen C1',
    'Peugeot 108',
    'Suzuki Celerio',
    'Skoda Citigo',
    'Smart Forfour',
    'Opel Karl',
    'Ford Ka+',
  ];

  final mediumCars = [
    'VW Golf',
    'Ford Focus',
    'Opel Astra',
    'Renault Megane',
    'Peugeot 308',
    'Seat Leon',
    'Skoda Octavia',
    'Audi A3',
    'BMW 1',
    'Mercedes A',
  ];

  final bigCars = [
    'VW Passat',
    'Ford Mondeo',
    'Opel Insignia',
    'Renault Talisman',
    'Peugeot 508',
    'Seat Exeo',
    'Skoda Superb',
    'Audi A4',
    'BMW 3',
  ];

  final transmissionTypes = ['Manual', 'Automatic'];

  final engineTypes = [
    'Petrol',
    'Diesel',
  ];

  List<String> filteredCars = [];

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
            skipDisabled: true,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500.0),
              child: Column(
                children: <Widget>[
                  FormBuilderDropdown<String>(
                    name: 'car_size',
                    decoration: InputDecoration(
                      labelText: 'Car size',
                      suffix: _carSizeHasError
                          ? const Icon(Icons.error)
                          : const Icon(Icons.check),
                      hintText: 'Select your preferred car size',
                    ),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                    items: carSizes
                        .map((location) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: location,
                              child: Text(location),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _carSizeHasError = !(widget
                                .formKey.currentState?.fields['car_size']
                                ?.validate() ??
                            false);
                        if (!_carSizeHasError) {
                          widget.formKey.currentState?.fields['car']?.reset();
                          if (val == 'Small') {
                            filteredCars.clear();
                            filteredCars.addAll(smallCars);
                          } else if (val == 'Medium') {
                            filteredCars.clear();
                            filteredCars.addAll(mediumCars);
                          } else if (val == 'Large') {
                            filteredCars.clear();
                            filteredCars.addAll(bigCars);
                          }
                        }
                      });
                    },
                    valueTransformer: (val) => val?.toString(),
                  ),
                  const SizedBox(height: 20),
                  FormBuilderDropdown<String>(
                    name: 'transmission_type',
                    decoration: InputDecoration(
                      labelText: 'Transmission type',
                      suffix: _transmissionTypeHasError
                          ? const Icon(Icons.error)
                          : const Icon(Icons.check),
                      hintText: 'Select your preferred transmission type',
                    ),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                    items: transmissionTypes
                        .map((location) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: location,
                              child: Text(location),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _transmissionTypeHasError = !(widget.formKey
                                .currentState?.fields['transmission_type']
                                ?.validate() ??
                            false);
                      });
                    },
                    valueTransformer: (val) => val?.toString(),
                  ),
                  const SizedBox(height: 20),
                  FormBuilderDropdown<String>(
                    name: 'engine_type',
                    decoration: InputDecoration(
                      labelText: 'Engine type',
                      suffix: _engineTypeHasError
                          ? const Icon(Icons.error)
                          : const Icon(Icons.check),
                      hintText: 'Select your preferred engine type',
                    ),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                    items: engineTypes
                        .map((location) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: location,
                              child: Text(location),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _engineTypeHasError = !(widget
                                .formKey.currentState?.fields['engine_type']
                                ?.validate() ??
                            false);
                      });
                    },
                    valueTransformer: (val) => val?.toString(),
                  ),
                  const SizedBox(height: 20),
                  FormBuilderDropdown<String>(
                    name: 'car',
                    decoration: InputDecoration(
                      labelText: 'Car model',
                      suffix: _carHasError
                          ? const Icon(Icons.error)
                          : const Icon(Icons.check),
                      hintText: 'Select your preferred car',
                    ),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                    items: filteredCars
                        .map((car) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: car,
                              child: Text(car),
                            ))
                        .toList(),
                    onChanged: (val) {
                      final field = widget.formKey.currentState?.fields['car'];
                      if (val != null &&
                          (field?.hasInteractedByUser ?? false)) {
                        setState(() {
                          _carHasError = !(field?.validate() ?? false);
                        });
                      }
                    },
                    valueTransformer: (val) => val?.toString(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
