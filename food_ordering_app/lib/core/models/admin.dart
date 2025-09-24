
import 'package:flutter/foundation.dart';

@immutable
class Admin {
  final String adminId;
  final String userId;

  const Admin({
    required this.adminId,
    required this.userId,
  });

  Admin copyWith({
    String? adminId,
    String? userId,
  }) {
    return Admin(
      adminId: adminId ?? this.adminId,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adminId': adminId,
      'user_id': userId,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      adminId: map['adminId'] ?? '',
      userId: map['user_id'] ?? '',
    );
  }
}
