
import 'package:flutter/foundation.dart';

@immutable
class Notification {
  final String notificationId;
  final String userId;
  final String title;
  final String body;
  final Map<String, dynamic> data;
  final bool read;
  final DateTime createdAt;

  const Notification({
    required this.notificationId,
    required this.userId,
    required this.title,
    required this.body,
    required this.data,
    required this.read,
    required this.createdAt,
  });

  Notification copyWith({
    String? notificationId,
    String? userId,
    String? title,
    String? body,
    Map<String, dynamic>? data,
    bool? read,
    DateTime? createdAt,
  }) {
    return Notification(
      notificationId: notificationId ?? this.notificationId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      data: data ?? this.data,
      read: read ?? this.read,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'notificationId': notificationId,
      'user_id': userId,
      'title': title,
      'body': body,
      'data': data,
      'read': read,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      notificationId: map['notificationId'] ?? '',
      userId: map['user_id'] ?? '',
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      data: Map<String, dynamic>.from(map['data']),
      read: map['read'] ?? false,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
    );
  }
}
