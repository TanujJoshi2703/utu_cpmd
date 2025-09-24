
import 'package:flutter/foundation.dart';

@immutable
class Rating {
  final String ratingId;
  final String userId;
  final String vendorId;
  final double rating;
  final String comment;
  final DateTime createdAt;

  const Rating({
    required this.ratingId,
    required this.userId,
    required this.vendorId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  Rating copyWith({
    String? ratingId,
    String? userId,
    String? vendorId,
    double? rating,
    String? comment,
    DateTime? createdAt,
  }) {
    return Rating(
      ratingId: ratingId ?? this.ratingId,
      userId: userId ?? this.userId,
      vendorId: vendorId ?? this.vendorId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ratingId': ratingId,
      'user_id': userId,
      'vendor_id': vendorId,
      'rating': rating,
      'comment': comment,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      ratingId: map['ratingId'] ?? '',
      userId: map['user_id'] ?? '',
      vendorId: map['vendor_id'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      comment: map['comment'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
    );
  }
}
