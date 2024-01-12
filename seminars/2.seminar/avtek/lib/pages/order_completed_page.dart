import 'package:avtek/forms/partial_summary.dart';
import 'package:avtek/forms/payment_type_form.dart';
import 'package:avtek/menu/menu_bar_wrapper.dart';
import 'package:avtek/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class OrderCompletedPage extends StatefulWidget {
  const OrderCompletedPage({Key? key, required this.formKeys})
      : super(key: key);

  final List<GlobalKey<FormBuilderState>> formKeys;

  @override
  _OrderCompletedPageState createState() => _OrderCompletedPageState();
}

class _OrderCompletedPageState extends State<OrderCompletedPage> {
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    final creditCardDateFormat = DateFormat('MM/yyyy');

    final pickupTime =
        widget.formKeys[0].currentState?.fields['pickup_time']?.value ??
            DateTime.now();
    final returnTime =
        widget.formKeys[0].currentState?.fields['return_time']?.value ??
            DateTime.now();

    final paymentType =
        widget.formKeys[4].currentState?.fields['payment_type']?.value ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Avtek",
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Order completed',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 40),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'General info',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Pickup location',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Drop off location',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Pickup time',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Drop off time',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Car info',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Transmission type',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Engine type',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Car',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Price per day',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Customer info',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Customer',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Address',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Email',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Phone',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Age',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Had license for',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Insurance',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Payment',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Total price',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Payment type',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      if (paymentType == 'Credit card') ...[
                        Text(
                          'Credit card number',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          'Expiration date',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          'CCV',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ]
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('', style: Theme.of(context).textTheme.titleLarge),
                      Text(
                        widget.formKeys[0].currentState
                                ?.fields['pickup_location']?.value ??
                            '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        widget.formKeys[0].currentState
                                ?.fields['drop_off_location']?.value ??
                            '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        dateFormat
                            .format((pickupTime ?? DateTime.now()) as DateTime),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        dateFormat
                            .format((returnTime ?? DateTime.now()) as DateTime),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('', style: Theme.of(context).textTheme.titleLarge),
                      Text(
                        widget.formKeys[1].currentState
                                ?.fields['transmission_type']?.value ??
                            '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        widget.formKeys[1].currentState?.fields['engine_type']
                                ?.value ??
                            '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        widget.formKeys[1].currentState?.fields['car']?.value ??
                            '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '${PartialSummary.pricePerDay} €',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('', style: Theme.of(context).textTheme.titleLarge),
                      Text(
                        (widget.formKeys[3].currentState?.fields['first_name']
                                    ?.value ??
                                '') +
                            (widget.formKeys[3].currentState
                                    ?.fields['last_name']?.value ??
                                ''),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        widget.formKeys[3].currentState?.fields['address']
                                ?.value ??
                            '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        widget.formKeys[3].currentState?.fields['email']
                                ?.value ??
                            '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        widget.formKeys[3].currentState?.fields['phone']
                                ?.value ??
                            '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        widget.formKeys[3].currentState?.fields['age']?.value ??
                            '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        (widget.formKeys[3].currentState?.fields['license_age']
                                    ?.value ??
                                '') +
                            ' years',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        (widget.formKeys[3].currentState
                                    ?.fields['accept_insurance']?.value ??
                                false)
                            ? '✅'
                            : '❌',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('', style: Theme.of(context).textTheme.titleLarge),
                      Text(
                        '${PaymentTypeForm.finalPrice} €',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        paymentType,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      if (paymentType == 'Credit card') ...[
                        Text(
                          'xxxx-xxxx-xxxx-${(widget.formKeys[5].currentState?.fields['number']?.value ?? '').substring(12)}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          creditCardDateFormat.format((widget
                                  .formKeys[5]
                                  .currentState
                                  ?.fields['expiration_date']
                                  ?.value ??
                              DateTime.now()) as DateTime),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'xxx',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ]
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuBarWrapper(
                        child: MainPage(),
                      ),
                    ),
                  );
                },
                child: const Text(
                  'New order',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
