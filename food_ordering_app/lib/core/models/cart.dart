
import 'package:food_ordering_app/core/models/menu_item.dart';

class Cart {
  final List<MenuItem> items;

  Cart({required this.items});

  double get totalPrice {
    return items.fold(0, (total, current) => total + current.price);
  }
}
