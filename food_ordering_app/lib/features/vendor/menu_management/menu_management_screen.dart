
import 'package:flutter/material.dart';
import 'package:food_ordering_app/core/models/menu_item.dart';

class MenuManagementScreen extends StatefulWidget {
  const MenuManagementScreen({super.key});

  @override
  State<MenuManagementScreen> createState() => _MenuManagementScreenState();
}

class _MenuManagementScreenState extends State<MenuManagementScreen> {
  final List<MenuItem> _menuItems = [
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
      available: false,
      image: '',
      tags: ['snack'],
      prepTimeMinutes: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Add new menu item
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _menuItems.length,
        itemBuilder: (context, index) {
          final menuItem = _menuItems[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(menuItem.title),
              subtitle: Text('\$${menuItem.price.toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Switch(
                    value: menuItem.available,
                    onChanged: (value) {
                      setState(() {
                        // This is a mock implementation. In a real app, you would update the backend.
                        // _menuItems[index] = menuItem.copyWith(available: value);
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // TODO: Edit menu item
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _menuItems.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
