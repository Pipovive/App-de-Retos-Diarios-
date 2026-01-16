import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_colors.dart';

class CustomCircleButtom extends StatelessWidget {
  final VoidCallback? buttonOnPressed;
  final Widget buttomChild;
  final bool isIcon;
  final bool isSelected;

  const CustomCircleButtom({
    super.key,
    required this.buttonOnPressed,
    required this.buttomChild,
    this.isIcon = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonOnPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(180)),
        side: isSelected
            ? BorderSide(color: AppColors.buttomColor, width: 3)
            : null,

        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: isIcon
            ? AppColors.buttomColor
            : AppColors.backgroundPrimaryColor,
        foregroundColor: AppColors.backgroundSecondaryColor,
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [buttomChild]),
    );
  }
}
