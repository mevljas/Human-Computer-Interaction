import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class Summary extends StatelessWidget {
  Summary({super.key, required this.formKeys});

  final List<GlobalKey<FormBuilderState>> formKeys;

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy hh:mm');
    final creditCardDateFormat = DateFormat('MM/yyyy');
    final pricePerHour = random.nextInt(20) + 5;

    final pickupTime = formKeys[0].currentState?.fields['pickup_time']?.value ??
        DateTime.now();
    final returnTime = formKeys[0].currentState?.fields['return_time']?.value ??
        DateTime.now();

    final paymentType =
        formKeys[4].currentState?.fields['payment_type']?.value ?? '';

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Text(
                  'Car',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Price per day',
                  style: Theme.of(context).textTheme.titleMedium,
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
                Text(
                  formKeys[0].currentState?.fields['pickup_location']?.value ??
                      '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  formKeys[0]
                          .currentState
                          ?.fields['drop_off_location']
                          ?.value ??
                      '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  dateFormat.format((pickupTime ?? DateTime.now()) as DateTime),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  dateFormat.format((returnTime ?? DateTime.now()) as DateTime),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  formKeys[1].currentState?.fields['car']?.value ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '$pricePerHour €',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '${((returnTime as DateTime).difference((pickupTime as DateTime))).inHours * pricePerHour} €',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  paymentType,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                if (paymentType == 'Credit card') ...[
                  Text(
                    formKeys[5].currentState?.fields['number']?.value ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    creditCardDateFormat.format((formKeys[5]
                            .currentState
                            ?.fields['expiration_date']
                            ?.value ??
                        DateTime.now()) as DateTime),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    formKeys[5].currentState?.fields['ccv']?.value ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]
              ],
            ),
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
