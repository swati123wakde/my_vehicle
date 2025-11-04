import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vehicle_controller.dart';
import '../utils/app_theme.dart';

class FilterChipBar extends StatelessWidget {
  final VehicleController controller;

  const FilterChipBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildFilterChip('All', 'all', Icons.list),
          SizedBox(width: 8),
          _buildFilterChip('Eco-Friendly', 'green', Icons.eco,
              color: AppTheme.greenStatus),
          SizedBox(width: 8),
          _buildFilterChip('Moderate', 'amber', Icons.warning,
              color: AppTheme.amberStatus),
          SizedBox(width: 8),
          _buildFilterChip('High Emission', 'red', Icons.dangerous,
              color: AppTheme.redStatus),
        ],
      ),
    ));
  }

  Widget _buildFilterChip(String label, String value, IconData icon,
      {Color? color}) {
    final isSelected = controller.filterStatus.value == value;
    final chipColor = color ?? AppTheme.darkPurple;

    return FilterChip(
      selected: isSelected,
      label: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: isSelected ? Colors.white : chipColor,
          ),
          SizedBox(width: 6),
          Text(label),
        ],
      ),
      onSelected: (selected) {
        controller.filterVehicles(value);
      },
      backgroundColor: Colors.white,
      selectedColor: chipColor,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : chipColor,
        fontWeight: FontWeight.bold,
      ),
      elevation: isSelected ? 4 : 2,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}