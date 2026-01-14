import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/core/constants/app_TextStyle.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/widgets/custom_head_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomHeadButton(title: "Home", showback: false),
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundSecondaryColor,

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
        // hoy no tengo muchas ganas de programar, soryy
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.backgroundPrimaryColor,
          statusBarIconBrightness: Brightness.light, // iconos CLAROS (light = oscuros, dark = claros)
          statusBarBrightness: Brightness.light, // para iOS
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Inicio de sessión", style: AppTextstyle.titleText),
          ],
        ),
      ),
    );
  }
}