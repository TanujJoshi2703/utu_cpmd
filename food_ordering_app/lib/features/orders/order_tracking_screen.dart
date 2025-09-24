
import 'package:flutter/material.dart';
import 'package:food_ordering_app/core/models/order.dart';

class OrderTrackingScreen extends StatelessWidget {
  final Order order;

  const OrderTrackingScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Order Status',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // TODO: Implement timeline view
            const Text('Placed'),
            const Icon(Icons.arrow_downward),
            const Text('Accepted'),
            const Icon(Icons.arrow_downward),
            const Text('Preparing'),
            const Icon(Icons.arrow_downward),
            const Text('Ready'),
            const Icon(Icons.arrow_downward),
            const Text('Completed'),
          ],
        ),
      ),
    );
  }
}
