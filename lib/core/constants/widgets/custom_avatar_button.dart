import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_TextStyle.dart';
import 'package:test_app/core/constants/app_colors.dart';

class AvatarButton extends StatelessWidget {
  final String label;
  final String image;
  final String? selectedImage;
  final bool isSelected;
  final VoidCallback onTap;

  const AvatarButton({
    super.key,
    required this.label,
    required this.image,
    this.selectedImage,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayImage = isSelected && selectedImage != null
        ? selectedImage!
        : image;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundSecondaryColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.backgroundSecondaryColor,
              width: 6,
            ),
          ),
          child: Material(
            color: AppColors.backgroundSecondaryColor,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.backgroundPrimaryColor
                        : AppColors.buttomColor,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Image.asset(
                    displayImage,
                    width: 94,
                    height: 94,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),

        Container(
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.backgroundPrimaryColor
                : AppColors.buttomColor,
            border: Border.all(width: 1, color: Colors.transparent),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: Text(
              label,
              style: isSelected
                  ? AppTextstyle.bodySecondaryText
                  : AppTextstyle.bodySecondaryText,
            ),
          ),
        ),
      ],
    );
  }
}
