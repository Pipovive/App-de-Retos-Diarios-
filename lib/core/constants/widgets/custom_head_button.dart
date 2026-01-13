import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_TextStyle.dart';
import 'package:test_app/core/constants/app_colors.dart';

class CustomHeadButton extends StatelessWidget {
  final String title;
  final bool showback;
  final List<Widget>? actions;
  const CustomHeadButton({
    super.key,
    required this.title,
    this.showback = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 100,
      actions: actions,
      backgroundColor: AppColors.backgroundPrimaryColor,
      elevation: 0,
      leading: showback
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
              color: AppColors.backgroundSecondaryColor,
            )
          : null,
      title: Text(title, style: AppTextstyle.subTitleSecondaryText),
      actionsIconTheme: IconThemeData(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32), // Borde circular abajo izquierda
          bottomRight: Radius.circular(32), // Borde circular abajo derecha
        ),
      ),
    );
  }
}
