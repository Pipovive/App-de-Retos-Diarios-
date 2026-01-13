import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/core/constants/app_TextStyle.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/widgets/custom_button.dart';
import 'package:test_app/core/constants/widgets/custom_text_field.dart';
import 'package:test_app/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  // color: AppColors.buttomColor
                ),
                height: 220,
              ),
              Positioned(
                top: -50,
                left: 170,
                child: Image.asset(
                  "assets/images/splash4.png",
                  fit: BoxFit.cover,
                  height: 250,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  // color: AppColors.buttomColor
                ),
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 150),
                      Text(
                        "Tu próximo reto te está esperando",
                        style: AppTextstyle.subTitleText,
                      ),
                      Text(
                        "Vuelve a entrenar tu mente con retos diseñados para aprender de forma simple y divertida.",
                        style: AppTextstyle.bodyText,
                      ),
                      CustomTextField(
                        hintText: "Correo Electrónico",
                        controller: null,
                        isPassword: false,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        hintText: "Contraseña",
                        controller: null,
                        isPassword: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "¿No tienes cuenta? ",
                              style: AppTextstyle.bodyText,
                            ),
                            TextSpan(
                              text: " Registrate",
                              style: AppTextstyle.bodyTertiaryText,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.register,
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        content: "Empezar",
                        onPressedVoid: () {
                          Navigator.pushNamed(context, AppRoutes.home);
                        },
                        buttomColor: AppColors.buttomColor,
                      ),
                      Text("o"),
                      CustomButton(
                        content: "Iniciar Sesion con Google",
                        onPressedVoid: () => {},
                        buttomColor: AppColors.backgroundPrimaryColor,
                      ),
                      CustomButton(
                        content: "Iniciar Sesion con Google",
                        onPressedVoid: () => {},
                        buttomColor: AppColors.backgroundPrimaryColor,
                        outline: true,
                      ),
                      SizedBox(height: 25,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
