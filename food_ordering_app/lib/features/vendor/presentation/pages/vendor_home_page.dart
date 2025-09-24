
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering_app/core/models/restaurant.dart';
import 'package:food_ordering_app/core/providers.dart';
import 'package:food_ordering_app/features/vendor/presentation/pages/edit_menu_page.dart';

class VendorHomePage extends ConsumerWidget {
  const VendorHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(restaurantsProvider);
    final selectedRestaurant = ref.watch(selectedRestaurantProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Home'),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: DropdownButton<Restaurant>(
                  value: selectedRestaurant,
                  hint: const Text('Select Restaurant'),
                  isExpanded: true,
                  underline: const SizedBox(),
                  onChanged: (Restaurant? newValue) {
                    ref.read(selectedRestaurantProvider.notifier).state = newValue;
                  },
                  items: restaurants.map<DropdownMenuItem<Restaurant>>((Restaurant restaurant) {
                    return DropdownMenuItem<Restaurant>(
                      value: restaurant,
                      child: Text(restaurant.name),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              if (selectedRestaurant != null)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: const Text('Edit Menu'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditMenuPage(),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
