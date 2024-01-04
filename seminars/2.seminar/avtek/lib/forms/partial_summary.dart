import 'package:flutter/material.dart';

class PartialSummary extends StatelessWidget {
  const PartialSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Pickup location: location',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Dropoff location: location',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Pickup TIme: time',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Dropoff Time: time',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Car: car',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Transmission: transmission',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Engine: engine',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
