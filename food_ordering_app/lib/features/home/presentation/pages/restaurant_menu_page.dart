
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering_app/core/providers.dart';

class RestaurantMenuPage extends ConsumerWidget {
  const RestaurantMenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurant = ref.watch(selectedRestaurantProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant!.name),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: restaurant.menu.length,
          itemBuilder: (context, index) {
            final menuItem = restaurant.menu[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(menuItem.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('₹${menuItem.price}'),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Add to Cart'),
                  onPressed: () {
                    ref.read(cartProvider.notifier).addItem(menuItem);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item added to cart'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
