
import 'package:flutter/material.dart';
import 'package:food_ordering_app/core/models/vendor.dart';
import 'package:food_ordering_app/features/home/widgets/vendor_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Vendor> _vendors = [
    Vendor(
      vendorId: '1',
      name: 'Ballu Bhai Canteen',
      location: {'lat': 12.9716, 'lng': 77.5946},
      openHours: {'start': '09:00', 'end': '18:00'},
      verified: true,
      ownerUserId: 'user1',
      rating: 4.5,
      contact: '1234567890',
    ),
    Vendor(
      vendorId: '2',
      name: 'Anna\'s Mess',
      location: {'lat': 12.9716, 'lng': 77.5946},
      openHours: {'start': '08:00', 'end': '20:00'},
      verified: true,
      ownerUserId: 'user2',
      rating: 4.2,
      contact: '0987654321',
    ),
    Vendor(
      vendorId: '3',
      name: 'Campus Cafe',
      location: {'lat': 12.9716, 'lng': 77.5946},
      openHours: {'start': '10:00', 'end': '22:00'},
      verified: false,
      ownerUserId: 'user3',
      rating: 3.8,
      contact: '1122334455',
    ),
  ];

  List<Vendor> _filteredVendors = [];
  String _searchTerm = '';
  bool _isVeg = false;
  bool _isPopular = false;
  bool _isNearby = false;

  @override
  void initState() {
    super.initState();
    _filteredVendors = _vendors;
  }

  void _filterVendors() {
    setState(() {
      _filteredVendors = _vendors.where((vendor) {
        final nameMatches = vendor.name.toLowerCase().contains(_searchTerm.toLowerCase());
        // TODO: Add logic for veg, popular, and nearby filters
        return nameMatches;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                _searchTerm = value;
                _filterVendors();
              },
              decoration: const InputDecoration(
                labelText: 'Search Vendors',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('Veg'),
                selected: _isVeg,
                onSelected: (selected) {
                  setState(() {
                    _isVeg = selected;
                    _filterVendors();
                  });
                },
              ),
              FilterChip(
                label: const Text('Popular'),
                selected: _isPopular,
                onSelected: (selected) {
                  setState(() {
                    _isPopular = selected;
                    _filterVendors();
                  });
                },
              ),
              FilterChip(
                label: const Text('Nearby'),
                selected: _isNearby,
                onSelected: (selected) {
                  setState(() {
                    _isNearby = selected;
                    _filterVendors();
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredVendors.length,
              itemBuilder: (context, index) {
                return VendorCard(vendor: _filteredVendors[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}


