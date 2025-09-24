
import 'package:flutter/material.dart';
import 'package:food_ordering_app/features/vendor/vendor_main_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 40),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanuj Joshi',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('tanuj.joshi@example.com'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Past Orders',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Mock data
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Order #${index + 1}'),
                    subtitle: const Text('Completed'),
                    trailing: const Text('\$25.00'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VendorMainScreen()),
                );
              },
              child: const Text('Switch to Vendor View (Dev)'),
            ),
          ],
        ),
      ),
    );
  }
}
