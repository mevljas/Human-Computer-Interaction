import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class PartialSummary extends StatelessWidget {
  PartialSummary({super.key, required this.formKeys});

  final List<GlobalKey<FormBuilderState>> formKeys;

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy hh:mm');
    final pricePerHour = random.nextInt(20) + 5;

    final pickupTime = formKeys[0].currentState?.fields['pickup_time']?.value ??
        DateTime.now();
    final returnTime = formKeys[0].currentState?.fields['return_time']?.value ??
        DateTime.now();

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
              ],
            ),
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
