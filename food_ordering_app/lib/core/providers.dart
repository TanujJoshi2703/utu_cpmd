
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering_app/core/models/cart.dart';
import 'package:food_ordering_app/core/models/menu_item.dart';
import 'package:food_ordering_app/core/models/restaurant.dart';
import 'package:food_ordering_app/core/models/wallet.dart';

final restaurantsProvider = StateNotifierProvider<RestaurantsNotifier, List<Restaurant>>((ref) {
  return RestaurantsNotifier();
});

class RestaurantsNotifier extends StateNotifier<List<Restaurant>> {
  RestaurantsNotifier() : super([
    Restaurant(
      name: 'Ballu Canteen',
      menu: [
        MenuItem(name: 'Samosa', price: 15),
        MenuItem(name: 'Kachori', price: 15),
        MenuItem(name: 'Vada Pav', price: 20),
        MenuItem(name: 'Dabeli', price: 20),
        MenuItem(name: 'Chole Bhature', price: 50),
        MenuItem(name: 'Pav Bhaji', price: 60),
        MenuItem(name: 'Pizza', price: 80),
        MenuItem(name: 'Burger', price: 50),
        MenuItem(name: 'Fries', price: 40),
        MenuItem(name: 'Coke', price: 20),
      ],
    ),
    Restaurant(
      name: 'Foodies',
      menu: [
        MenuItem(name: 'Pizza', price: 120),
        MenuItem(name: 'Burger', price: 70),
        MenuItem(name: 'Pasta', price: 90),
        MenuItem(name: 'Sandwich', price: 60),
        MenuItem(name: 'Noodles', price: 80),
        MenuItem(name: 'Manchurian', price: 70),
        MenuItem(name: 'Fried Rice', price: 80),
        MenuItem(name: 'Coffee', price: 30),
        MenuItem(name: 'Tea', price: 20),
        MenuItem(name: 'Shake', price: 50),
      ],
    ),
    Restaurant(
      name: 'Gurukrupa',
      menu: [
        MenuItem(name: 'Thali', price: 100),
        MenuItem(name: 'Roti', price: 10),
        MenuItem(name: 'Sabji', price: 40),
        MenuItem(name: 'Dal', price: 30),
        MenuItem(name: 'Rice', price: 20),
        MenuItem(name: 'Papad', price: 10),
        MenuItem(name: 'Salad', price: 20),
        MenuItem(name: 'Sweet', price: 30),
        MenuItem(name: 'Lassi', price: 40),
        MenuItem(name: 'Chaas', price: 20),
      ],
    ),
  ]);

  void updateMenuItem(String restaurantName, int menuItemIndex, String newName, double newPrice) {
    state = [
      for (final restaurant in state)
        if (restaurant.name == restaurantName)
          Restaurant(
            name: restaurant.name,
            menu: [
              for (int i = 0; i < restaurant.menu.length; i++)
                if (i == menuItemIndex)
                  MenuItem(name: newName, price: newPrice)
                else
                  restaurant.menu[i],
            ],
          )
        else
          restaurant,
    ];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, Cart>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<Cart> {
  CartNotifier() : super(Cart(items: []));

  void addItem(MenuItem item) {
    state = Cart(items: [...state.items, item]);
  }

  void clearCart() {
    state = Cart(items: []);
  }
}

final walletProvider = StateNotifierProvider<WalletNotifier, Wallet>((ref) {
  return WalletNotifier();
});

class WalletNotifier extends StateNotifier<Wallet> {
  WalletNotifier() : super(Wallet(balance: 1000));

  void deduct(double amount) {
    state = Wallet(balance: state.balance - amount);
  }
}

final selectedRestaurantProvider = StateProvider<Restaurant?>((ref) => null);
