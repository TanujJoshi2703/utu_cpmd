
import 'package:flutter/foundation.dart';

@immutable
class Order {
  final String orderId;
  final String userId;
  final String vendorId;
  final List<Map<String, dynamic>> items;
  final double subtotal;
  final double discount;
  final double walletUsed;
  final String status;
  final String slotId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Order({
    required this.orderId,
    required this.userId,
    required this.vendorId,
    required this.items,
    required this.subtotal,
    required this.discount,
    required this.walletUsed,
    required this.status,
    required this.slotId,
    required this.createdAt,
    required this.updatedAt,
  });

  Order copyWith({
    String? orderId,
    String? userId,
    String? vendorId,
    List<Map<String, dynamic>>? items,
    double? subtotal,
    double? discount,
    double? walletUsed,
    String? status,
    String? slotId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      vendorId: vendorId ?? this.vendorId,
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      walletUsed: walletUsed ?? this.walletUsed,
      status: status ?? this.status,
      slotId: slotId ?? this.slotId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'user_id': userId,
      'vendor_id': vendorId,
      'items': items,
      'subtotal': subtotal,
      'discount': discount,
      'wallet_used': walletUsed,
      'status': status,
      'slot_id': slotId,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderId: map['orderId'] ?? '',
      userId: map['user_id'] ?? '',
      vendorId: map['vendor_id'] ?? '',
      items: List<Map<String, dynamic>>.from(map['items']?.map((x) => x)),
      subtotal: map['subtotal']?.toDouble() ?? 0.0,
      discount: map['discount']?.toDouble() ?? 0.0,
      walletUsed: map['wallet_used']?.toDouble() ?? 0.0,
      status: map['status'] ?? '',
      slotId: map['slot_id'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }
}
