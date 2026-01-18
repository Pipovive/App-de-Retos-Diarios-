import 'package:flutter/material.dart';

import 'package:test_app/core/constants/widgets/custom_avatar_button.dart';
import 'package:test_app/core/constants/widgets/custom_calendar.dart';

import 'package:test_app/core/constants/widgets/custom_circle_buttom.dart';

import 'package:test_app/core/constants/widgets/custom_head_button.dart';
// import 'package:test_app/core/constants/widgets/custom_head_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _setState = true;
  // bool _setButtonState = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: CustomHeadButton(
          title: "Página de inicio",
          onPressed: () {},
          children: [
            SizedBox(
              height: 160,
              child: AvatarButton(
                label: "Mátematicas",
                image: "assets/images/catHeader2Active.png",
                selectedImage: "assets/images/catHeader2.png",
                isSelected: _setState,
                onTap: () {
                  setState(() {
                    if (_setState == true) {
                      _setState = false;
                    } else {
                      _setState = true;
                    }
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 160,
              child: AvatarButton(
                label: "Inglés",
                image: "assets/images/catHeader2.png",
                selectedImage: "assets/images/catHeader2.png",
                isSelected: true,
                onTap: () {},
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 160,
              child: AvatarButton(
                label: "Michi",
                image: "assets/images/catHeader2.png",
                selectedImage: "assets/images/catHeader2.png",
                isSelected: true,
                onTap: () {},
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 160,
              child: AvatarButton(
                label: "Michi",
                image: "assets/images/catHeader2.png",
                selectedImage: "assets/images/catHeader2.png",
                isSelected: true,
                onTap: () {},
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 160,
              child: AvatarButton(
                label: "Michi",
                image: "assets/images/catHeader2.png",
                selectedImage: "assets/images/catHeader2.png",
                isSelected: true,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 80),
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomCircleButtom(
                      buttonOnPressed: onTapButton,
                      buttomChild: Icon(Icons.search, size: 25),
                      isIcon: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      left: 4,
                      right: 4,
                      bottom: 8,
                    ),
                    child: CustomCircleButtom(
                      buttonOnPressed: onTapButton,
                      buttomChild: Text("Primer O"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      left: 4,
                      right: 4,
                      bottom: 8,
                    ),
                    child: CustomCircleButtom(
                      buttonOnPressed: onTapButton,
                      buttomChild: Text("Primer O"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      left: 4,
                      right: 4,
                      bottom: 8,
                    ),
                    child: CustomCircleButtom(
                      buttonOnPressed: onTapButton,
                      buttomChild: Text("Primer O"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      left: 4,
                      right: 4,
                      bottom: 8,
                    ),
                    child: CustomCircleButtom(
                      buttonOnPressed: onTapButton,
                      buttomChild: Text("Primer O"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomCalendar(),
        ],
      ),
    );
  }
}

void onTapButton() {}
