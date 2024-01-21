import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormBuilderState> formKey;

  @override
  State<CustomerForm> createState() {
    return _CustomerFormState();
  }
}

class _CustomerFormState extends State<CustomerForm> {
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
            key: widget.formKey,
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
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    name: 'first_name',
                    decoration: InputDecoration(
                      labelText: 'First name',
                      suffixIcon: _firstNameHasError
                          ? const Icon(Icons.error, color: Colors.red)
                          : const Icon(Icons.check, color: Colors.green),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _firstNameHasError = !(widget
                                .formKey.currentState?.fields['first_name']
                                ?.validate() ??
                            false);
                      });
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(2),
                      FormBuilderValidators.maxLength(20),
                    ]),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    name: 'last_name',
                    decoration: InputDecoration(
                      labelText: 'Last name',
                      suffixIcon: _lastNameHasError
                          ? const Icon(Icons.error, color: Colors.red)
                          : const Icon(Icons.check, color: Colors.green),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _lastNameHasError = !(widget
                                .formKey.currentState?.fields['last_name']
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
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    name: 'address',
                    decoration: InputDecoration(
                      labelText: 'Address',
                      suffixIcon: _addressHasError
                          ? const Icon(Icons.error, color: Colors.red)
                          : const Icon(Icons.check, color: Colors.green),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _addressHasError = !(widget
                                .formKey.currentState?.fields['address']
                                ?.validate() ??
                            false);
                      });
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(5),
                      FormBuilderValidators.maxLength(50),
                    ]),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    name: 'email',
                    decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: _emailHasError
                          ? const Icon(Icons.error, color: Colors.red)
                          : const Icon(Icons.check, color: Colors.green),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _emailHasError = !(widget
                                .formKey.currentState?.fields['email']
                                ?.validate() ??
                            false);
                      });
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                      FormBuilderValidators.maxLength(50),
                      FormBuilderValidators.min(5),
                    ]),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    name: 'phone',
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      suffixIcon: _phoneHasError
                          ? const Icon(Icons.error, color: Colors.red)
                          : const Icon(Icons.check, color: Colors.green),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _phoneHasError = !(widget
                                .formKey.currentState?.fields['phone']
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
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    name: 'age',
                    decoration: InputDecoration(
                      labelText: 'Age in years',
                      suffixIcon: _ageHasError
                          ? const Icon(Icons.error, color: Colors.red)
                          : const Icon(Icons.check, color: Colors.green),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _ageHasError = !(widget
                                .formKey.currentState?.fields['age']
                                ?.validate() ??
                            false);
                      });
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.min(18),
                      FormBuilderValidators.max(150),
                    ]),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    name: 'license_age',
                    decoration: InputDecoration(
                      labelText:
                          'For how many years have you had your license?',
                      suffixIcon: _licenseAgeHasError
                          ? const Icon(Icons.error, color: Colors.red)
                          : const Icon(Icons.check, color: Colors.green),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _licenseAgeHasError = !(widget
                                .formKey.currentState?.fields['license_age']
                                ?.validate() ??
                            false);
                      });
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.max(100),
                      FormBuilderValidators.min(0),
                    ]),
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
                            text: 'Would you like car insurance for 2€/day?',
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
          ),
        ],
      ),
    );
  }
}
