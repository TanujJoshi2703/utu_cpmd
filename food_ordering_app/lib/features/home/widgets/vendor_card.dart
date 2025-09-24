
import 'package:flutter/material.dart';
import 'package:food_ordering_app/core/models/vendor.dart';
import 'package:food_ordering_app/features/vendor/vendor_view.dart';

class VendorCard extends StatelessWidget {
  final Vendor vendor;

  const VendorCard({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VendorDetailScreen(vendor: vendor),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vendor.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 5),
                  Text(vendor.rating.toString()),
                ],
              ),
              const SizedBox(height: 5),
              Text(vendor.contact),
            ],
          ),
        ),
      ),
    );
  }
}
