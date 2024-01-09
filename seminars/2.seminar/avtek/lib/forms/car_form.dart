import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CarForm extends StatefulWidget {
  const CarForm({Key? key, required this.formKey}) : super(key: key);

  @override
  State<CarForm> createState() {
    return _CarFormState();
  }

  final formKey;
}

class _CarFormState extends State<CarForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final bool _ageHasError = false;
  bool _pickupLocationHasError = false;
  final bool _dropoffLocationHasError = false;

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
    'Dacia Sandero',
    'Seat Mii',
    'Nissan Micra',
    'Mazda 2',
    'Honda Jazz',
    'Hyundai i20',
    'Kia Rio',
    'Toyota Yaris',
    'VW Polo',
    'Ford Fiesta',
    'Opel Corsa',
    'Renault Clio',
    'Peugeot 208',
    'Citroen C3',
    'Seat Ibiza',
    'Skoda Fabia',
    'Audi A1',
    'Mini Cooper',
    'Alfa Romeo Mito',
    'Fiat Punto',
    'Hyundai i20',
    'Kia Rio',
    'Toyota Yaris',
    'VW Polo',
    'Ford Fiesta',
    'Opel Corsa',
    'Renault Clio',
    'Peugeot 208',
    'Citroen C3',
    'Seat Ibiza',
    'Skoda Fabia',
    'Audi A1',
    'Mini Cooper',
    'Alfa Romeo Mito',
    'Fiat Punto',
    'Hyundai i20',
    'Kia Rio',
    'Toyota Yaris',
    'VW Polo',
    'Ford Fiesta',
    'Opel Corsa',
    'Renault Clio',
    'Peugeot 208',
    'Citroen C3',
    'Seat Ibiza',
    'Skoda Fabia',
    'Audi A1',
    'Mini Cooper',
    'Alfa Romeo Mito',
    'Fiat Punto',
    'Hyundai i20',
    'Kia Rio',
    'Toyota Yaris',
    'VW Polo',
    'Ford Fiesta',
    'Opel Corsa',
    'Renault Clio',
    'Peugeot 208',
    'Citroen C3',
    'Seat Ibiza',
    'Skoda Fabia',
    'Audi A1',
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
    'Mercedes C',
    'VW Passat',
    'Ford Mondeo',
    'Opel Insignia',
    'Renault Talisman',
    'Peugeot 508',
    'Seat Exeo',
    'Skoda Superb',
    'Audi A4',
    'BMW 3',
    'Mercedes C',
    'VW Passat',
    'Ford Mondeo',
    'Opel Insignia',
    'Renault Talisman',
    'Peugeot 508',
    'Seat Exeo',
    'Skoda Superb',
    'Audi A4',
    'BMW 3',
    'Mercedes C',
    'VW Passat',
    'Ford Mondeo',
    'Opel Insignia',
    'Renault Talisman',
    'Peugeot 508',
    'Seat Exeo',
    'Skoda Superb',
    'Audi A4',
    'BMW 3',
    'Mercedes C',
    'VW Passat',
    'Ford Mondeo',
    'Opel Insignia',
    'Renault Talisman',
    'Peugeot 508',
    'Seat Exeo',
    'Skoda Superb',
    'Audi A4',
    'BMW 3',
    'Mercedes C',
    'VW Passat',
    'Ford Mondeo',
    'Opel Insignia',
    'Renault Talisman',
    'Peugeot 508',
    'Seat Exeo',
    'Skoda Superb',
    'Audi A4',
    'BMW 3',
    'Mercedes C',
    'VW Passat',
    'Ford Mondeo',
    'Opel Insignia',
    'Renault Talisman',
    'Peugeot 508',
    'Seat Exeo',
    'Skoda Superb',
    'Audi A4',
    'BMW 3',
    'Mercedes C',
  ];

  final transmissionTypes = ['Manual', 'Automatic'];

  final engineTypes = [
    'Petrol',
    'Diesel',
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
                FormBuilderDropdown<String>(
                  name: 'car_size',
                  decoration: InputDecoration(
                    labelText: 'Car size',
                    suffix: _pickupLocationHasError
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
                      _pickupLocationHasError = !(widget
                              .formKey.currentState?.fields['car_size']
                              ?.validate() ??
                          false);
                    });
                  },
                  valueTransformer: (val) => val?.toString(),
                ),
                const SizedBox(height: 20),
                FormBuilderDropdown<String>(
                  name: 'transmission_type',
                  decoration: InputDecoration(
                    labelText: 'Transmission type',
                    suffix: _pickupLocationHasError
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
                      _pickupLocationHasError = !(widget
                              .formKey.currentState?.fields['transmission_type']
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
                    suffix: _pickupLocationHasError
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
                      _pickupLocationHasError = !(widget
                              .formKey.currentState?.fields['engine_type']
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
