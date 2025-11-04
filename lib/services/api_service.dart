import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/vehicle_model.dart';

class ApiService {
  // Mock API endpoint (replace with your actual backend)
  static const String baseUrl = 'https://api.example.com';

  // Mock login
  Future<bool> login(String username, String password) async {
    // Simulate API call delay
    await Future.delayed(Duration(seconds: 2));

    // Static credentials
    if (username == 'admin' && password == 'admin123') {
      return true;
    }
    return false;
  }

  // Fetch vehicles (Mock data)
  Future<List<Vehicle>> fetchVehicles() async {
    // Simulate API call delay
    await Future.delayed(Duration(seconds: 1));

    // Mock data
    List<Map<String, dynamic>> mockData = [
      {
        'id': '1',
        'name': 'Honda City',
        'model': '2024',
        'fuelEfficiency': 18.5,
        'age': 1,
        'type': 'Sedan',
        'manufacturer': 'Honda',
      },
      {
        'id': '2',
        'name': 'Maruti Swift',
        'model': '2023',
        'fuelEfficiency': 22.0,
        'age': 2,
        'type': 'Hatchback',
        'manufacturer': 'Maruti Suzuki',
      },
      {
        'id': '3',
        'name': 'Hyundai Creta',
        'model': '2018',
        'fuelEfficiency': 16.5,
        'age': 7,
        'type': 'SUV',
        'manufacturer': 'Hyundai',
      },
      {
        'id': '4',
        'name': 'Toyota Fortuner',
        'model': '2020',
        'fuelEfficiency': 12.0,
        'age': 5,
        'type': 'SUV',
        'manufacturer': 'Toyota',
      },
      {
        'id': '5',
        'name': 'Tata Nexon EV',
        'model': '2023',
        'fuelEfficiency': 25.0,
        'age': 2,
        'type': 'Electric SUV',
        'manufacturer': 'Tata Motors',
      },
      {
        'id': '6',
        'name': 'Mahindra Scorpio',
        'model': '2015',
        'fuelEfficiency': 13.5,
        'age': 10,
        'type': 'SUV',
        'manufacturer': 'Mahindra',
      },
      {
        'id': '7',
        'name': 'Hyundai i20',
        'model': '2024',
        'fuelEfficiency': 20.0,
        'age': 1,
        'type': 'Hatchback',
        'manufacturer': 'Hyundai',
      },
      {
        'id': '8',
        'name': 'Ford EcoSport',
        'model': '2017',
        'fuelEfficiency': 15.5,
        'age': 8,
        'type': 'Compact SUV',
        'manufacturer': 'Ford',
      },
    ];

    return mockData.map((json) => Vehicle.fromJson(json)).toList();
  }
}