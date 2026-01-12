import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_TextStyle.dart';
import 'package:test_app/core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundSecondaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Title(
              color: AppColors.backgroundPrimaryColor,
              child: Text("Splash-Screen", style: AppTextstyle.bodyText),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [_buildPage1(), _buildPage2(), _buildPage3()],
      ),
    );
  }

  Widget _buildPage1() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(color: AppColors.backgroundSecondaryColor),
        child: Column(
          children: [
            Image.asset('assets/images/splashCat.jpg', height: 500),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Bienvenido a mi primera',
                    style: AppTextstyle.subTitleText,
                  ),
                  TextSpan(text: " APP", style: AppTextstyle.titleText),
                ],
              ),
            ),
            Text(
              "Entrena tu mente, un reto al día.",
              style: AppTextstyle.bodyText,
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buildDot(0), _buildDot(1), _buildDot(2)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage2() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(color: AppColors.backgroundSecondaryColor),
        child: Column(
          children: [
            Image.asset('assets/images/splashCat2.jpg', height: 500),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Bienvenido a mi primera',
                    style: AppTextstyle.subTitleText,
                  ),
                  TextSpan(text: " APP", style: AppTextstyle.titleText),
                ],
              ),
            ),
            Text(
              "Entrena tu mente, un reto al día.",
              style: AppTextstyle.bodyText,
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buildDot(0), _buildDot(1), _buildDot(2)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage3() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(color: AppColors.backgroundSecondaryColor),
        child: Column(
          children: [
            Image.asset('assets/images/splashCat3.jpg', height: 500),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Bienvenido a mi primera',
                    style: AppTextstyle.subTitleText,
                  ),
                  TextSpan(text: " APP", style: AppTextstyle.titleText),
                ],
              ),
            ),
            Text(
              "Entrena tu mente, un reto al día.",
              style: AppTextstyle.bodyText,
            ),
            SizedBox(height: 58),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDot(0),
                  _buildDot(1),
                  _buildDot(2),
                  ElevatedButton(
                    onPressed: () => {},
              
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(44),
                      backgroundColor: AppColors.buttomColor,
                    ),
                    child: Text(
                      "data",
                      style: AppTextstyle.subTitleSecondaryText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      height: 10,
      width: _currentPage == index ? 30 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? AppColors.buttomColor
            : AppColors.backgroundPrimaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
