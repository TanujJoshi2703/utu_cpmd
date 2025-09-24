
import 'package:flutter/material.dart';
import 'package:food_ordering_app/core/models/menu_item.dart';
import 'package:food_ordering_app/core/models/order.dart';
import 'package:food_ordering_app/features/orders/order_tracking_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> cartItems = [
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

    final double subtotal = cartItems.fold(0, (sum, item) => sum + item.price);
    final double discount = 2.0;
    final double total = subtotal - discount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item.title),
                  trailing: Text('\${item.price.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal'),
                    Text('\${subtotal.toStringAsFixed(2)}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Discount'),
                    Text('-\${discount.toStringAsFixed(2)}'),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('\${total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final order = Order(
                      orderId: 'order1',
                      userId: 'user1',
                      vendorId: 'vendor1',
                      items: [],
                      subtotal: subtotal,
                      discount: discount,
                      walletUsed: total,
                      status: 'placed',
                      slotId: 'slot1',
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderTrackingScreen(order: order),
                      ),
                    );
                  },
                  child: const Text('Place Order'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
