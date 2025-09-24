
import 'package:flutter/material.dart';
import 'package:food_ordering_app/core/models/menu_item.dart';
import 'package:food_ordering_app/core/models/vendor.dart';
import 'package:food_ordering_app/features/orders/cart_screen.dart';
import 'package:food_ordering_app/features/vendor/widgets/menu_item_card.dart';

class VendorDetailScreen extends StatelessWidget {
  final Vendor vendor;

  const VendorDetailScreen({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(
        itemId: '1',
        title: 'Tea',
        price: 10.0,
        veg: true,
        available: true,
        image: '',
        tags: ['drink'],
        prepTimeMinutes: 5,
      ),
      MenuItem(
        itemId: '2',
        title: 'Coffee',
        price: 15.0,
        veg: true,
        available: true,
        image: '',
        tags: ['drink'],
        prepTimeMinutes: 5,
      ),
      MenuItem(
        itemId: '3',
        title: 'Samosa',
        price: 20.0,
        veg: true,
        available: true,
        image: '',
        tags: ['snack'],
        prepTimeMinutes: 10,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(vendor.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vendor.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return MenuItemCard(menuItem: menuItems[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        label: const Text('View Cart'),
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
