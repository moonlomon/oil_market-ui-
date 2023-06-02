import 'package:flutter/material.dart';
import 'package:oil_market/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  MainCalendar({Key? key, required this.onDaySelected, required this.selectedDate}) : super(key: key);

  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_kr',
      onDaySelected: onDaySelected,
      selectedDayPredicate: (date) =>
        date.year == selectedDate.year &&
        date.month == selectedDate.month &&
        date.day == selectedDate.day,
      firstDay: DateTime(1800,01,01),
      lastDay: DateTime(2300,12,31),
      focusedDay: selectedDate,
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: LightGreyColor,
        ),
        weekendDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: LightGreyColor,
        ),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: PrimaryColor,
            width: 1.0,
          )
        ),
        defaultTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: DarkGreyColor
        ),
        weekendTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: DarkGreyColor
        ),
        selectedTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: PrimaryColor
        ),
      ),
    );
  }
}
