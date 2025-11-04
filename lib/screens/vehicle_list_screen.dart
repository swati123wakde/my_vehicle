import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vehicle_controller.dart';
import '../widgets/vehicle_card.dart';
import '../widgets/filter_chip_bar.dart';
import '../utils/app_theme.dart';

class VehicleListScreen extends StatelessWidget {
  const VehicleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VehicleController controller = Get.put(VehicleController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Fleet'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Get.offAllNamed('/login');
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.purpleGradient,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: AppTheme.purpleGradient,
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
            child: FilterChipBar(controller: controller),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.darkPurple,
                  ),
                );
              }

              if (controller.filteredVehicles.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.car_crash,
                        size: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No vehicles found',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  controller.refreshVehicles();
                },
                color: AppTheme.darkPurple,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemCount: controller.filteredVehicles.length,
                  itemBuilder: (context, index) {
                    return VehicleCard(
                      vehicle: controller.filteredVehicles[index],
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}