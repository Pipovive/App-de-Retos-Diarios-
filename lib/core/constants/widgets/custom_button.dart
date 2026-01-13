import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_TextStyle.dart';
import 'package:test_app/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressedVoid;
  final Color buttomColor;
  final bool outline;

  const CustomButton({
    super.key,
    required this.content,
    required this.onPressedVoid,
    required this.buttomColor,
    this.outline = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressedVoid,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: outline ? AppColors.backgroundSecondaryColor : buttomColor,
          elevation: outline ? 2 : 0,
          side: outline 
              ? BorderSide(color: buttomColor, width: 2)
              : BorderSide.none
        ),
        child: Text(content, style: outline ? AppTextstyle.bodyText: AppTextstyle.bodySecondaryText),
      ),
    );
  }
}
