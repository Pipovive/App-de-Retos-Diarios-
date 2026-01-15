import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_colors.dart';

class CustomCircleButtom extends StatefulWidget {
  const CustomCircleButtom({super.key});

  @override
  State<CustomCircleButtom> createState() => _CustomCircleButtomState();
}

class _CustomCircleButtomState extends State<CustomCircleButtom> {
  @override
  Widget build(BuildContext context) {
    return  Material(
      
      color: AppColors.buttomColor,
      child: InkWell(
        
      ),
    );
  }
}