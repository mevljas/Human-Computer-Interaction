import 'package:flutter/material.dart';

class OrderCompletedPage extends StatefulWidget {
  const OrderCompletedPage({Key? key}) : super(key: key);

  @override
  _OrderCompletedPageState createState() => _OrderCompletedPageState();
}

class _OrderCompletedPageState extends State<OrderCompletedPage> {
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
        child: Column(
          children: [
            Text(
              'Order completed',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: 20),
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
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text(
                'New order',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
