import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_TextStyle.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/widgets/custom_horizontal_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime nowDay = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28),
      ),
      child: Container(
        decoration: BoxDecoration(color: AppColors.backgroundPrimaryColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 0),
              child: Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: Text(
                      "Dias Cumplidos",
                      style: AppTextstyle.subTitleSecondaryText,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "Calendario",
                      style: AppTextstyle.bodySecondaryText,
                    ),
                  ),
                ],
              ),
            ),
            CustomHorizontalCalendar(
              selectedDate: nowDay,
              daysWithActivity: daysWithActivity,
              onDaySelected: (fecha) {
                setState(() {
                  nowDay = fecha;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // ESTE SET EMULA LOS DIAS EN LOS QUE EL USUARIO REALIZO LA TRIVIA
  Set<DateTime> daysWithActivity = {
    DateTime(2026, 1, 10),
    DateTime(2026, 1, 12),
    DateTime(2026, 1, 15),
    DateTime(2026, 1, 16),
    DateTime(2026, 1, 18),
  };

  //ESTA FUNCION PERMITA SABER SI EL USUARIO REALIZO LA PRUEBA EL DIA QUE SE NECESITE PREGUNTAR

  bool _havActivity(DateTime date) {
    return daysWithActivity.any(
      (day) =>
          day.year == date.year &&
          day.month == date.month &&
          day.day == date.day,
    );
  }
}
