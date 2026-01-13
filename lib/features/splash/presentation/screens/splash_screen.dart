import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/core/constants/app_TextStyle.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/routes/app_routes.dart';

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
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    if (mounted) {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundPrimaryColor, // color barra
        statusBarIconBrightness: Brightness.light, // iconos oscuros
        statusBarBrightness: Brightness.light, // iOS
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // PageView con todas las páginas
            PageView(
              controller: _pageController,
              children: [_buildPage1(), _buildPage2(), _buildPage3()],
            ),

            // Imagen flotante por encima de todo
          ],
        ),
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
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_buildDot(0), _buildDot(1), _buildDot(2)],
                ),
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
              "Resuelve retos diarios de matemáticas, lógica.",
              style: AppTextstyle.bodyText,
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_buildDot(0), _buildDot(1), _buildDot(2)],
                ),
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
            Text("Solo te tomará unos minutos.", style: AppTextstyle.bodyText),
            SizedBox(height: 58),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [_buildDot(0), _buildDot(1), _buildDot(2)],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.login),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(44),
                      backgroundColor: AppColors.buttomColor,
                    ),
                    child: Text(
                      "Empezar",
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
