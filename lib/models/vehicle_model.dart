import 'dart:ui';

import '../utils/app_theme.dart';

class Vehicle {
  final String id;
  final String name;
  final String model;
  final double fuelEfficiency; // km/liter
  final int age; // years
  final String type;
  final String manufacturer;

  Vehicle({
    required this.id,
    required this.name,
    required this.model,
    required this.fuelEfficiency,
    required this.age,
    required this.type,
    required this.manufacturer,
  });

  // Determine vehicle status color
  Color getStatusColor() {
    if (fuelEfficiency >= 15 && age <= 5) {
      return AppTheme.greenStatus; // Green - Fuel efficient and low polluting
    } else if (fuelEfficiency >= 15 && age > 5) {
      return AppTheme.amberStatus; // Amber - Fuel efficient but moderately polluting
    } else {
      return AppTheme.redStatus; // Red - Neither fuel efficient nor low polluting
    }
  }

  String getStatusText() {
    if (fuelEfficiency >= 15 && age <= 5) {
      return 'Eco-Friendly';
    } else if (fuelEfficiency >= 15 && age > 5) {
      return 'Moderate Emission';
    } else {
      return 'High Emission';
    }
  }

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      name: json['name'],
      model: json['model'],
      fuelEfficiency: json['fuelEfficiency'].toDouble(),
      age: json['age'],
      type: json['type'],
      manufacturer: json['manufacturer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'model': model,
      'fuelEfficiency': fuelEfficiency,
      'age': age,
      'type': type,
      'manufacturer': manufacturer,
    };
  }
}
