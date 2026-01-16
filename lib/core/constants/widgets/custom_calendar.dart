import 'package:flutter/material.dart';
import 'package:test_app/core/constants/widgets/custom_horizontal_calendar.dart';
import 'package:test_app/features/home/presentation/screens/home_screen.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late final DateTime nowDay;
  late final DateTime lastDay;

  late final List<DateTime> currentDaysMonth;

  @override
  void initState() {
    _chargeDats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text("dia $currentDaysMonth"),
          Text(_havActivity(nowDay).toString()),
          CustomHorizontalCalendar(
            nowDay: nowDay,
            daysWithActivity: daysWithActivity,
            selectDaty: (fecha) {
              setState(() {
                nowDay = fecha;
              });
            }
          ),
        ],
      ),
    );
  }

  //ESTA FUNCION SE ENCARGA DE CARGAR LOS DIAS ACTUALES DEL MES

  void _chargeDats() {
    nowDay = DateTime.now();
    lastDay = DateTime(nowDay.year, nowDay.month + 1, 0);
    currentDaysMonth = List.generate(
      lastDay.day,
      (index) => DateTime(nowDay.year, nowDay.month, index + 1),
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
          day.month == date.year &&
          day.day == date.day,
    );
  }
}
