import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';

class CustomHorizontalCalendar extends StatelessWidget {
  final DateTime nowDay;
  final Set<DateTime> daysWithActivity;
  final void Function(DateTime) selectDaty;
  final DateTime? month;

  const CustomHorizontalCalendar({
    super.key,
    required this.nowDay,
    required this.daysWithActivity,
    required this.selectDaty,
    this.month,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime nowMont = month ?? DateTime.now();
    final List<DateTime> manyDaysMoth = _daysMonth(nowMont);

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: manyDaysMoth.length,
        itemBuilder: (context, index) {
          //AQUI TENEMOS QUE DES-CARGAR CADA INDEX EN UN DAY PARA CREAR CADA ITEM
          final day = manyDaysMoth[index];
          //MIRAR CUAL FUEL DIA SELECCIONADO EN CADA ITEM
          final isSelect = _isSameDay(day, nowDay);
          //SABER QUE DYA ES HOY PARA MARCARLO
          final isToday = _isSameDay(day, DateTime.now());
          //SABER SI TIENE ACTIVIDADES
          final isActivity = _hasActivity(day);

          return _Dayitem(
            day:  day,
            isSelect: isSelect,
            isToday: isToday,
            hasActivity: isActivity,
            ontap: () => selectDaty(day),
          );
        },
      ),
    );
  }

  //CREAR UNA METODO QUE ME PERMITA LLENAR UNA LISTA DE DE LOS DIAS DE CUALQUIER MES

  List<DateTime> _daysMonth(DateTime nowDate) {
    DateTime firstDay = DateTime(nowDate.year, nowDate.month, nowDate.day);
    DateTime lastDay = DateTime(firstDay.year, firstDay.month + 1, 0);

    return List.generate(
      lastDay.day,
      (index) => DateTime(nowDate.year, nowDate.month, index + 1),
    );
  }

  // CREAR UN METODO QUE PERMITA CONOCER SI DIA A Y DIA B SON EL MISMO

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  //VERIFICAR SI UN DIA TIENE ACTIVDAD
  bool _hasActivity(DateTime dateToday) {
    return daysWithActivity.any((index) => _isSameDay(index, dateToday));
  }

  //CREAR COMPONENTE INTERNO DE _DAYITEM
}

class _Dayitem extends StatelessWidget {
  final DateTime day;
  final bool isSelect;
  final bool isToday;
  final bool hasActivity;
  final VoidCallback ontap;

  const _Dayitem({
    super.key,
    required this.day,
    required this.isSelect,
    required this.isToday,
    required this.hasActivity,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

    );
  }
}
