import 'package:get/get.dart';
import '../models/vehicle_model.dart';
import '../services/api_service.dart';

class VehicleController extends GetxController {
  final ApiService _apiService = ApiService();

  final RxList<Vehicle> vehicles = <Vehicle>[].obs;
  final RxList<Vehicle> filteredVehicles = <Vehicle>[].obs;
  final RxBool isLoading = false.obs;
  final RxString filterStatus = 'all'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchVehicles();
  }

  Future<void> fetchVehicles() async {
    isLoading.value = true;
    try {
      final data = await _apiService.fetchVehicles();
      vehicles.value = data;
      filteredVehicles.value = data;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch vehicles: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void filterVehicles(String status) {
    filterStatus.value = status;
    if (status == 'all') {
      filteredVehicles.value = vehicles;
    } else if (status == 'green') {
      filteredVehicles.value = vehicles
          .where((v) => v.fuelEfficiency >= 15 && v.age <= 5)
          .toList();
    } else if (status == 'amber') {
      filteredVehicles.value = vehicles
          .where((v) => v.fuelEfficiency >= 15 && v.age > 5)
          .toList();
    } else if (status == 'red') {
      filteredVehicles.value = vehicles
          .where((v) => v.fuelEfficiency < 15)
          .toList();
    }
  }

  void refreshVehicles() {
    fetchVehicles();
  }
}
