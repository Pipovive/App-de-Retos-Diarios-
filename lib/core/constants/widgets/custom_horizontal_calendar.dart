import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_TextStyle.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:intl/intl.dart';

class CustomHorizontalCalendar extends StatefulWidget {
  final DateTime selectedDate; //
  final Set<DateTime> daysWithActivity;
  final void Function(DateTime) onDaySelected; //
  final DateTime? month;

  const CustomHorizontalCalendar({
    super.key,
    required this.selectedDate, //
    required this.daysWithActivity,
    required this.onDaySelected, //
    this.month,
  });

  @override
  State<CustomHorizontalCalendar> createState() =>
      _CustomHorizontalCalendarState();
}

class _CustomHorizontalCalendarState extends State<CustomHorizontalCalendar> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToday());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime currentMonth = widget.month ?? DateTime.now();
    final List<DateTime> daysOfMonth = _daysMonth(currentMonth);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 180,
        width: 380,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 125,
              child: SizedBox(height: 50, child: _buildContent()),
            ),
            ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: daysOfMonth.length,
              itemBuilder: (context, index) {
                final day = daysOfMonth[index];
                final isSelected = _isSameDay(day, widget.selectedDate);
                final isToday = _isSameDay(day, DateTime.now());
                final hasActivity = _hasActivity(day);

                return _DayItem(
                  // ← Capitalizado (convención para clases)
                  day: day,
                  isSelected: isSelected,
                  isToday: isToday,
                  hasActivity: hasActivity,
                  onTap: () => widget.onDaySelected(day),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Genera todos los días del mes
  List<DateTime> _daysMonth(DateTime nowDate) {
    DateTime firstDay = DateTime(nowDate.year, nowDate.month, 1); // ← CORREGIDO
    //                                                          ↑
    //                                                          └─ Siempre día 1
    DateTime lastDay = DateTime(firstDay.year, firstDay.month + 1, 0);

    return List.generate(
      lastDay.day,
      (index) => DateTime(nowDate.year, nowDate.month, index + 1),
    );
  }

  /// Verifica si dos fechas son el mismo día
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  /// Verifica si un día tiene actividad
  bool _hasActivity(DateTime dateToday) {
    return widget.daysWithActivity.any((date) => _isSameDay(date, dateToday));
  }

  Widget _buildContent() {
    final havActivity = _hasActivity(widget.selectedDate);
    final time = DateFormat('HH:mm').format(widget.selectedDate);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.tertiaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Text(
                  havActivity
                      ? "Actividad Realizada"
                      : "Todavia no haz hecho ninguna trivia :(",
                  style: AppTextstyle.bodyText,
                  textAlign: TextAlign.start,
                ),
                Spacer(),
                Text(
                  havActivity ? time : "",
                  style: AppTextstyle.bodyText,
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToday() {
    final DateTime today = DateTime.now();
    final List<DateTime> daysOfMonth = _daysMonth(today);

    final index = daysOfMonth.indexWhere(
      (day) =>
          today.day == day.day &&
          today.month == day.month &&
          today.year == day.year,
    );

    const withItem = 70.0;

    if (index == -1) return;

    final positionIndex = withItem * index;

    _scrollController.animateTo(
      positionIndex,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
    );
  }
}

class _DayItem extends StatelessWidget {
  // ← Capitalizado
  final DateTime day;
  final bool isSelected;
  final bool isToday;
  final bool hasActivity;
  final VoidCallback onTap;

  const _DayItem({
    required this.day,
    required this.isSelected,
    required this.isToday,
    required this.hasActivity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const daysWeeks = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
    final dayNameWeek = daysWeeks[day.weekday - 1];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayNameWeek,
              style: TextStyle(
                color: isSelected
                    ? AppColors.tertiaryColor
                    : AppColors.secondaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.tertiaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                border: Border.all(
                  color: isToday ? AppColors.tertiaryColor : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    '${day.day}',
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white, //
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (hasActivity)
                    Positioned(
                      bottom: 2,
                      child: Icon(
                        Icons.check_circle,
                        size: 12,
                        color:
                            isSelected //
                            ? Colors.green[700]
                            : Colors.green,
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
}
