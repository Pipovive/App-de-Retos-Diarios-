import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_TextStyle.dart';
import 'package:test_app/core/constants/app_colors.dart';

class CustomTabNavigationButton extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> valueChanged;

  const CustomTabNavigationButton({
    super.key,
    required this.selectedIndex,
    required this.valueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.backgroundPrimaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(Icons.home, 0, "Inicio"),
          _buildItem(Icons.calendar_month, 1, "Icon 2"),
          _buildItem(Icons.person, 2, "Icon 3"),
          _buildItem(Icons.map, 3, "Icon 4"),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icondat, int index, String label) {
    final bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => valueChanged(index),
      child: AnimatedContainer(
        width: isSelected ? 70 : 50,
        height: isSelected ? 70 : 50,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(0, isSelected ? -28 : 0, 0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secondaryColor,
          border: Border.all(
            color: isSelected
                ? AppColors.backgroundSecondaryColor
                : AppColors.backgroundPrimaryColor,
            width: 4,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // ICONO
            Icon(
              icondat,
              size: isSelected ? 32 : 26,
              color: isSelected
                  ? AppColors.buttomColor
                  : AppColors.backgroundSecondaryColor,
            ),

            // TEXTO SOLO CUANDO ESTÁ SELECCIONADO
            if (isSelected)
              Positioned(
                bottom: -30,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isSelected ? 1 : 0,
                  child: Text(label, style: AppTextstyle.bodySecondaryText),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
