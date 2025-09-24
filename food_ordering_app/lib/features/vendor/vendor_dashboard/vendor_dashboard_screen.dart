
import 'package:flutter/material.dart';
import 'package:food_ordering_app/core/models/order.dart';

class VendorDashboardScreen extends StatefulWidget {
  const VendorDashboardScreen({super.key});

  @override
  State<VendorDashboardScreen> createState() => _VendorDashboardScreenState();
}

class _VendorDashboardScreenState extends State<VendorDashboardScreen> {
  final List<Order> _orders = [
    Order(
      orderId: '1',
      userId: 'user1',
      vendorId: 'vendor1',
      items: [
        {'item_id': 'item1', 'qty': 2, 'price': 10.0},
      ],
      subtotal: 20.0,
      discount: 0.0,
      walletUsed: 20.0,
      status: 'placed',
      slotId: 'slot1',
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      updatedAt: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    Order(
      orderId: '2',
      userId: 'user2',
      vendorId: 'vendor1',
      items: [
        {'item_id': 'item2', 'qty': 1, 'price': 15.0},
        {'item_id': 'item3', 'qty': 1, 'price': 20.0},
      ],
      subtotal: 35.0,
      discount: 5.0,
      walletUsed: 30.0,
      status: 'accepted',
      slotId: 'slot2',
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      updatedAt: DateTime.now().subtract(const Duration(minutes: 8)),
    ),
    Order(
      orderId: '3',
      userId: 'user3',
      vendorId: 'vendor1',
      items: [
        {'item_id': 'item4', 'qty': 3, 'price': 12.0},
      ],
      subtotal: 36.0,
      discount: 0.0,
      walletUsed: 36.0,
      status: 'preparing',
      slotId: 'slot3',
      createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
      updatedAt: DateTime.now().subtract(const Duration(minutes: 12)),
    ),
  ];

  String _selectedStatus = 'all';

  @override
  Widget build(BuildContext context) {
    final filteredOrders = _orders.where((order) {
      if (_selectedStatus == 'all') {
        return true;
      }
      return order.status == _selectedStatus;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Dashboard'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('All'),
                selected: _selectedStatus == 'all',
                onSelected: (selected) {
                  if (selected) {
                    setState(() {
                      _selectedStatus = 'all';
                    });
                  }
                },
              ),
              FilterChip(
                label: const Text('New'),
                selected: _selectedStatus == 'placed',
                onSelected: (selected) {
                  if (selected) {
                    setState(() {
                      _selectedStatus = 'placed';
                    });
                  }
                },
              ),
              FilterChip(
                label: const Text('Accepted'),
                selected: _selectedStatus == 'accepted',
                onSelected: (selected) {
                  if (selected) {
                    setState(() {
                      _selectedStatus = 'accepted';
                    });
                  }
                },
              ),
              FilterChip(
                label: const Text('Preparing'),
                selected: _selectedStatus == 'preparing',
                onSelected: (selected) {
                  if (selected) {
                    setState(() {
                      _selectedStatus = 'preparing';
                    });
                  }
                },
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                final order = filteredOrders[index];
                return Dismissible(
                  key: Key(order.orderId),
                  onDismissed: (direction) {
                    setState(() {
                      _orders.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Order #${order.orderId} ${direction == DismissDirection.startToEnd ? 'accepted' : 'rejected'}'),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(Icons.check, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text('Order #${order.orderId}'),
                      subtitle: Text('Status: ${order.status}'),
                      trailing: Text('\${order.subtotal.toStringAsFixed(2)}'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
