import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class DatePick extends StatefulWidget {
  const DatePick({Key? key, required this.onChanged}) : super(key: key);
  final Function onChanged;

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  var _selectedDay = DateTime(1);
  var _focusedDay = DateTime.now();
  final dateStyle = AppTextStyles.primaryBlackMediumText12_Calendar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 4),
            blurRadius: 24,
          ),
        ],
        color: Colors.white,
      ),
      child: TableCalendar(
        rowHeight: 40,
        firstDay: DateTime.now(),
        lastDay: DateTime.utc(2030),
        focusedDay: _focusedDay,
        daysOfWeekHeight: 40,
        daysOfWeekStyle: DaysOfWeekStyle(
          dowTextFormatter: (date, locale) =>
              DateFormat('E').format(date).substring(0, 2),
          weekdayStyle: AppTextStyles.greyAltMediumText2_12,
          weekendStyle: AppTextStyles.greyAltMediumText2_12,
        ),
        headerStyle: HeaderStyle(
          headerPadding: EdgeInsets.symmetric(vertical: 10),
          leftChevronPadding: EdgeInsets.all(0),
          leftChevronIcon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.blueColor,
            size: 20,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.blueColor,
            size: 20,
          ),
          rightChevronPadding: EdgeInsets.all(0),
          titleCentered: true,
          titleTextStyle: AppTextStyles.titleBlackMediumText16,
        ),
        availableCalendarFormats: {CalendarFormat.month: 'Month'},
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            widget.onChanged(selectedDay);
          });
        },
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(shape: BoxShape.circle),
          selectedDecoration: BoxDecoration(
            color: AppColors.primaryPurpleColor,
            shape: BoxShape.circle,
          ),
          disabledTextStyle: dateStyle.copyWith(color: AppColors.lighGreyColor),
          defaultTextStyle: dateStyle,
          withinRangeTextStyle: dateStyle,
          outsideTextStyle: dateStyle,
          todayTextStyle: dateStyle,
          holidayTextStyle: dateStyle,
          weekendTextStyle: dateStyle,
          selectedTextStyle: dateStyle.copyWith(color: Colors.white),
          cellMargin: EdgeInsets.all(4),
          outsideDaysVisible: false,
        ),
      ),
    );
  }
}
