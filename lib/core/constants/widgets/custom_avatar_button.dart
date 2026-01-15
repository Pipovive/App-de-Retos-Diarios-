import 'package:flutter/material.dart';

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
    final displayImage =
        isSelected && selectedImage != null ? selectedImage! : image;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? Colors.blue
                      : Colors.transparent,
                  width: 3,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: ClipOval(
                  child: Image.asset(
                    displayImage,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight:
                isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
