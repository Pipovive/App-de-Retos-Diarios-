import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_TextStyle.dart';
import 'package:test_app/core/constants/app_colors.dart';

class CustomHeadButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final List<Widget> children;

  const CustomHeadButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      backgroundColor: AppColors.backgroundPrimaryColor,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 32, left: 20),
        child: Text(title, style: AppTextstyle.subTitleSecondaryText),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 22, right: 20),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.add),
            color: AppColors.backgroundSecondaryColor,
          ),
        ),
      ],
      flexibleSpace: children.isEmpty
          ? null
          : Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: -70,
                  left: 16,
                  right: 0,
                  child: SizedBox(
                    height: 140,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(children: children),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
