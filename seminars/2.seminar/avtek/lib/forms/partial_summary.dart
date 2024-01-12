import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class PartialSummary extends StatelessWidget {
  const PartialSummary({super.key, required this.formKeys});

  final List<GlobalKey<FormBuilderState>> formKeys;

  static int? totalPrice;
  static int? hours;

  static const pricePerHour = 3;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    final pickupTime = formKeys[0].currentState?.fields['pickup_time']?.value ??
        DateTime.now();
    final returnTime = formKeys[0].currentState?.fields['return_time']?.value ??
        DateTime.now();

    hours =
        ((returnTime as DateTime).difference((pickupTime as DateTime))).inHours;

    totalPrice = hours! * pricePerHour;

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
                  'Price per hour',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Sum',
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
                  dateFormat.format(pickupTime),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  dateFormat.format(returnTime),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  formKeys[1]
                          .currentState
                          ?.fields['transmission_type']
                          ?.value ??
                      '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  formKeys[1].currentState?.fields['engine_type']?.value ?? '',
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
                  '$totalPrice €',
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
