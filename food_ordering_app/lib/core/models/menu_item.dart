
import 'package:flutter/foundation.dart';

@immutable
class MenuItem {
  final String itemId;
  final String title;
  final double price;
  final bool veg;
  final bool available;
  final String image;
  final List<String> tags;
  final int prepTimeMinutes;

  const MenuItem({
    required this.itemId,
    required this.title,
    required this.price,
    required this.veg,
    required this.available,
    required this.image,
    required this.tags,
    required this.prepTimeMinutes,
  });

  MenuItem copyWith({
    String? itemId,
    String? title,
    double? price,
    bool? veg,
    bool? available,
    String? image,
    List<String>? tags,
    int? prepTimeMinutes,
  }) {
    return MenuItem(
      itemId: itemId ?? this.itemId,
      title: title ?? this.title,
      price: price ?? this.price,
      veg: veg ?? this.veg,
      available: available ?? this.available,
      image: image ?? this.image,
      tags: tags ?? this.tags,
      prepTimeMinutes: prepTimeMinutes ?? this.prepTimeMinutes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'title': title,
      'price': price,
      'veg': veg,
      'available': available,
      'image': image,
      'tags': tags,
      'prep_time_minutes': prepTimeMinutes,
    };
  }

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      itemId: map['itemId'] ?? '',
      title: map['title'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      veg: map['veg'] ?? false,
      available: map['available'] ?? false,
      image: map['image'] ?? '',
      tags: List<String>.from(map['tags']),
      prepTimeMinutes: map['prep_time_minutes']?.toInt() ?? 0,
    );
  }
}
