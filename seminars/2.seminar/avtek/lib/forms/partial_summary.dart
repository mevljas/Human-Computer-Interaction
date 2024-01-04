import 'package:avtek/widgets/summary_row.dart';
import 'package:flutter/material.dart';

class PartialSummary extends StatelessWidget {
  const PartialSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SummaryRow(title: 'Pickup location', value: 'Ljubljana'),
        SummaryRow(title: 'Dropoff location', value: 'Maribor'),
        SummaryRow(title: 'Pickup time', value: '12:00'),
        SummaryRow(title: 'Dropoff time', value: '14:00'),
        SummaryRow(title: 'Car', value: 'BMW'),
        SummaryRow(title: 'Price per day', value: '50€'),
        SummaryRow(title: 'Total price', value: '100€'),
      ],
    );
  }
}
