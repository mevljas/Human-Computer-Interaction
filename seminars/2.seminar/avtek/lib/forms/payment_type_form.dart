import 'package:avtek/forms/partial_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PaymentTypeForm extends StatefulWidget {
  const PaymentTypeForm(
      {Key? key, required this.formKey, required this.formKeys})
      : super(key: key);

  final GlobalKey<FormBuilderState> formKey;

  static int? finalPrice;

  final List<GlobalKey<FormBuilderState>> formKeys;

  @override
  State<PaymentTypeForm> createState() {
    return _PaymentTypeFormState();
  }
}

class _PaymentTypeFormState extends State<PaymentTypeForm> {
  bool _paymentTypeHasError = false;

  var paymentTypeOptions = ['Cash', 'Credit card'];

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    final bool CarInsurance =
        widget.formKeys[3].currentState?.fields['accept_insurance']?.value ??
            false;

    PaymentTypeForm.finalPrice = CarInsurance
        ? (PartialSummary.totalPrice! +
            (PartialSummary.hours! / 24 * 2).toInt())
        : PartialSummary.totalPrice;

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
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total price',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${PaymentTypeForm.finalPrice} €',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                FormBuilderDropdown<String>(
                  name: 'payment_type',
                  decoration: InputDecoration(
                    labelText: 'Payment type',
                    suffix: _paymentTypeHasError
                        ? const Icon(Icons.error)
                        : const Icon(Icons.check),
                    hintText: 'Select your preferred payment type',
                  ),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  items: paymentTypeOptions
                      .map((location) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: location,
                            child: Text(location),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _paymentTypeHasError = !(widget
                              .formKey.currentState?.fields['payment_type']
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
