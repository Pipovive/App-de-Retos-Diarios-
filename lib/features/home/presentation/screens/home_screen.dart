import 'package:flutter/material.dart';

import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/widgets/custom_avatar_button.dart';
import 'package:test_app/core/constants/widgets/custom_circle_buttom.dart';
import 'package:test_app/core/constants/widgets/custom_head_button.dart';
// import 'package:test_app/core/constants/widgets/custom_head_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: CustomHeadButton(
          title: "Página de inicio",
          onPressed: () {},
          children: [
            AvatarButton(
              label: "Michi",
              image: "assets/images/cat1.png",
              selectedImage: "assets/images/cat1_active.png",
              isSelected: true,
              onTap: () {
                print("Michi presionado");
              },
            ),

            SizedBox(width: 10),
            CustomCicleContainer(),
            SizedBox(width: 10),
            CustomCicleContainer(),
            SizedBox(width: 10),
            CustomCicleContainer(),
            SizedBox(width: 10),
            CustomCicleContainer(),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 130),
        child: Column(children: [Text("Contenido"), CustomCircleButtom()]),
      ),
    );
  }
}

class CustomCicleContainer extends StatelessWidget {
  const CustomCicleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondaryColor,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.backgroundSecondaryColor,
            border: Border.all(
              width: 4,
              color: AppColors.backgroundPrimaryColor,
            ),
          ),
          child: Image.asset("assets/images/catHeader2.png"),
        ),
      ),
    );
  }
}
