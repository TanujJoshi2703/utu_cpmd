
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering_app/core/models/menu_item.dart';
import 'package:food_ordering_app/core/providers.dart';

class EditMenuPage extends ConsumerWidget {
  const EditMenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurant = ref.watch(selectedRestaurantProvider)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Menu - ${restaurant.name}'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/logo.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.1),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
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
                  trailing: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.teal),
                    onPressed: () {
                      _showEditDialog(context, ref, restaurant.name, index, menuItem);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    WidgetRef ref,
    String restaurantName,
    int menuItemIndex,
    MenuItem menuItem,
  ) {
    final nameController = TextEditingController(text: menuItem.name);
    final priceController = TextEditingController(text: menuItem.price.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Menu Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                final newName = nameController.text;
                final newPrice = double.parse(priceController.text);
                ref.read(restaurantsProvider.notifier).updateMenuItem(
                      restaurantName,
                      menuItemIndex,
                      newName,
                      newPrice,
                    );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
