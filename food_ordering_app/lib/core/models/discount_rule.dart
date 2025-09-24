
import 'package:flutter/foundation.dart';

@immutable
class DiscountRule {
  final String discountId;
  final String type;
  final double value;
  final double minPurchase;
  final String application;
  final DateTime activeFrom;
  final DateTime activeTo;
  final Map<String, dynamic> conditions;

  const DiscountRule({
    required this.discountId,
    required this.type,
    required this.value,
    required this.minPurchase,
    required this.application,
    required this.activeFrom,
    required this.activeTo,
    required this.conditions,
  });

  DiscountRule copyWith({
    String? discountId,
    String? type,
    double? value,
    double? minPurchase,
    String? application,
    DateTime? activeFrom,
    DateTime? activeTo,
    Map<String, dynamic>? conditions,
  }) {
    return DiscountRule(
      discountId: discountId ?? this.discountId,
      type: type ?? this.type,
      value: value ?? this.value,
      minPurchase: minPurchase ?? this.minPurchase,
      application: application ?? this.application,
      activeFrom: activeFrom ?? this.activeFrom,
      activeTo: activeTo ?? this.activeTo,
      conditions: conditions ?? this.conditions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'discountId': discountId,
      'type': type,
      'value': value,
      'min_purchase': minPurchase,
      'application': application,
      'active_from': activeFrom.millisecondsSinceEpoch,
      'active_to': activeTo.millisecondsSinceEpoch,
      'conditions': conditions,
    };
  }

  factory DiscountRule.fromMap(Map<String, dynamic> map) {
    return DiscountRule(
      discountId: map['discountId'] ?? '',
      type: map['type'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      minPurchase: map['min_purchase']?.toDouble() ?? 0.0,
      application: map['application'] ?? '',
      activeFrom: DateTime.fromMillisecondsSinceEpoch(map['active_from']),
      activeTo: DateTime.fromMillisecondsSinceEpoch(map['active_to']),
      conditions: Map<String, dynamic>.from(map['conditions']),
    );
  }
}
