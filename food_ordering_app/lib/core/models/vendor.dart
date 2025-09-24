
import 'package:flutter/foundation.dart';

@immutable
class Vendor {
  final String vendorId;
  final String name;
  final Map<String, double> location;
  final Map<String, String> openHours;
  final bool verified;
  final String ownerUserId;
  final double rating;
  final String contact;

  const Vendor({
    required this.vendorId,
    required this.name,
    required this.location,
    required this.openHours,
    required this.verified,
    required this.ownerUserId,
    required this.rating,
    required this.contact,
  });

  Vendor copyWith({
    String? vendorId,
    String? name,
    Map<String, double>? location,
    Map<String, String>? openHours,
    bool? verified,
    String? ownerUserId,
    double? rating,
    String? contact,
  }) {
    return Vendor(
      vendorId: vendorId ?? this.vendorId,
      name: name ?? this.name,
      location: location ?? this.location,
      openHours: openHours ?? this.openHours,
      verified: verified ?? this.verified,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      rating: rating ?? this.rating,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'vendorId': vendorId,
      'name': name,
      'location': location,
      'open_hours': openHours,
      'verified': verified,
      'owner_user_id': ownerUserId,
      'rating': rating,
      'contact': contact,
    };
  }

  factory Vendor.fromMap(Map<String, dynamic> map) {
    return Vendor(
      vendorId: map['vendorId'] ?? '',
      name: map['name'] ?? '',
      location: Map<String, double>.from(map['location']),
      openHours: Map<String, String>.from(map['open_hours']),
      verified: map['verified'] ?? false,
      ownerUserId: map['owner_user_id'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      contact: map['contact'] ?? '',
    );
  }
}
