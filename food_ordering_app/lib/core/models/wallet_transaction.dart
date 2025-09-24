
import 'package:flutter/foundation.dart';

@immutable
class WalletTransaction {
  final String txnId;
  final String userId;
  final String type;
  final double amount;
  final String currency;
  final Map<String, dynamic> meta;
  final DateTime createdAt;

  const WalletTransaction({
    required this.txnId,
    required this.userId,
    required this.type,
    required this.amount,
    required this.currency,
    required this.meta,
    required this.createdAt,
  });

  WalletTransaction copyWith({
    String? txnId,
    String? userId,
    String? type,
    double? amount,
    String? currency,
    Map<String, dynamic>? meta,
    DateTime? createdAt,
  }) {
    return WalletTransaction(
      txnId: txnId ?? this.txnId,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      meta: meta ?? this.meta,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'txnId': txnId,
      'user_id': userId,
      'type': type,
      'amount': amount,
      'currency': currency,
      'meta': meta,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  factory WalletTransaction.fromMap(Map<String, dynamic> map) {
    return WalletTransaction(
      txnId: map['txnId'] ?? '',
      userId: map['user_id'] ?? '',
      type: map['type'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      currency: map['currency'] ?? '',
      meta: Map<String, dynamic>.from(map['meta']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
    );
  }
}
