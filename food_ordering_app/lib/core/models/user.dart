
import 'package:flutter/foundation.dart';

@immutable
class User {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String role;
  final String campusId;
  final double walletBalance;
  final DateTime createdAt;
  final String photoUrl;

  const User({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.campusId,
    required this.walletBalance,
    required this.createdAt,
    required this.photoUrl,
  });

  User copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? role,
    String? campusId,
    double? walletBalance,
    DateTime? createdAt,
    String? photoUrl,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      campusId: campusId ?? this.campusId,
      walletBalance: walletBalance ?? this.walletBalance,
      createdAt: createdAt ?? this.createdAt,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'campus_id': campusId,
      'wallet_balance': walletBalance,
      'created_at': createdAt.millisecondsSinceEpoch,
      'photo_url': photoUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      role: map['role'] ?? '',
      campusId: map['campus_id'] ?? '',
      walletBalance: map['wallet_balance']?.toDouble() ?? 0.0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      photoUrl: map['photo_url'] ?? '',
    );
  }
}
