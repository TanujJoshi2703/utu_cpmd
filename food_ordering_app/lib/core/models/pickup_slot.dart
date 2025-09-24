
import 'package:flutter/foundation.dart';

@immutable
class PickupSlot {
  final String slotId;
  final DateTime startTime;
  final int capacity;
  final int booked;

  const PickupSlot({
    required this.slotId,
    required this.startTime,
    required this.capacity,
    required this.booked,
  });

  PickupSlot copyWith({
    String? slotId,
    DateTime? startTime,
    int? capacity,
    int? booked,
  }) {
    return PickupSlot(
      slotId: slotId ?? this.slotId,
      startTime: startTime ?? this.startTime,
      capacity: capacity ?? this.capacity,
      booked: booked ?? this.booked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slotId': slotId,
      'start_time': startTime.millisecondsSinceEpoch,
      'capacity': capacity,
      'booked': booked,
    };
  }

  factory PickupSlot.fromMap(Map<String, dynamic> map) {
    return PickupSlot(
      slotId: map['slotId'] ?? '',
      startTime: DateTime.fromMillisecondsSinceEpoch(map['start_time']),
      capacity: map['capacity']?.toInt() ?? 0,
      booked: map['booked']?.toInt() ?? 0,
    );
  }
}
