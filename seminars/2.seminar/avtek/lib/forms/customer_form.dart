import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({Key? key}) : super(key: key);

  @override
  State<CustomerForm> createState() {
    return _CustomerFormState();
  }
}

class _CustomerFormState extends State<CustomerForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _firstNameHasError = false;
  bool _lastNameHasError = false;
  bool _addressHasError = false;
  bool _emailHasError = false;
  bool _phoneHasError = false;
  bool _ageHasError = false;
  bool _licenseAgeHasError = false;

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormBuilder(
            key: _formKey,
            // enabled: false,
            onChanged: () {
              _formKey.currentState!.save();
              debugPrint(_formKey.currentState!.value.toString());
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
                  autovalidateMode: AutovalidateMode.always,
                  name: 'first_name',
                  decoration: InputDecoration(
                    labelText: 'First name',
                    suffixIcon: _firstNameHasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _firstNameHasError = !(_formKey
                              .currentState?.fields['first_name']
                              ?.validate() ??
                          false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(2),
                    FormBuilderValidators.maxLength(20),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'last_name',
                  decoration: InputDecoration(
                    labelText: 'Last name',
                    suffixIcon: _lastNameHasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _lastNameHasError = !(_formKey
                              .currentState?.fields['last_name']
                              ?.validate() ??
                          false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(2),
                    FormBuilderValidators.maxLength(20),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'address',
                  decoration: InputDecoration(
                    labelText: 'Address',
                    suffixIcon: _addressHasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _addressHasError = !(_formKey
                              .currentState?.fields['address']
                              ?.validate() ??
                          false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(5),
                    FormBuilderValidators.maxLength(50),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'email',
                  decoration: InputDecoration(
                    labelText: 'Email',
                    suffixIcon: _emailHasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _emailHasError = !(_formKey.currentState?.fields['email']
                              ?.validate() ??
                          false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                    FormBuilderValidators.maxLength(50),
                    FormBuilderValidators.min(5),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'phone',
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    suffixIcon: _phoneHasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _phoneHasError = !(_formKey.currentState?.fields['phone']
                              ?.validate() ??
                          false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.equalLength(9),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'age',
                  decoration: InputDecoration(
                    labelText: 'Age',
                    suffixIcon: _ageHasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _ageHasError =
                          !(_formKey.currentState?.fields['age']?.validate() ??
                              false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.min(0),
                    FormBuilderValidators.max(150),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                // TODO(mevljas): use a more appropriate widget.
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'license_age',
                  decoration: InputDecoration(
                    labelText: 'License age',
                    suffixIcon: _licenseAgeHasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _licenseAgeHasError = !(_formKey
                              .currentState?.fields['license_age']
                              ?.validate() ??
                          false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.max(100),
                    FormBuilderValidators.min(0),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                FormBuilderCheckbox(
                  name: 'accept_insurance',
                  initialValue: false,
                  onChanged: _onChanged,
                  title: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Would you like car insurance ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      debugPrint(_formKey.currentState?.value.toString());
                    } else {
                      debugPrint(_formKey.currentState?.value.toString());
                      debugPrint('validation failed');
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _formKey.currentState?.reset();
                  },
                  // color: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    'Reset',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
