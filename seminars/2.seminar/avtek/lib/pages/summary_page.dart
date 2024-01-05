import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Avtek",
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
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
                    'Ljubljana',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Maribor',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '12:00',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '14:00',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'BMW',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '50€',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '100€',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
