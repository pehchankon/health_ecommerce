import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class TimePick extends StatefulWidget {
  const TimePick({
    super.key,
    required this.onChanged,
  });
  final Function onChanged;

  @override
  State<TimePick> createState() => _TimePickState();
}

class _TimePickState extends State<TimePick> {
  final timeSlotsCount = 12;
  int selectedSlot = -1;
  List<DateTime> timeList = [];

  updateSelectedSlot(int newSlot) {
    setState(() => selectedSlot = newSlot);
    widget.onChanged(timeList[newSlot]);
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime(1, 1, 1, 8);
    for (int i = 0; i < timeSlotsCount; i++) {
      timeList.add(dateTime.add(Duration(hours: i)));
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 2.h,
        childAspectRatio: 2.sp,
      ),
      itemCount: timeSlotsCount,
      itemBuilder: (context, index) => _timeGridChip(
        dateTime: timeList[index],
        selected: (selectedSlot == index),
        onTap: () => updateSelectedSlot(index),
      ),
    );
  }

  GestureDetector _timeGridChip({
    required DateTime dateTime,
    bool selected = false,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryPurpleColor,
            width: 2,
          ),
          color: selected ? AppColors.primaryPurpleColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          DateFormat('hh:mm a').format(dateTime),
          style: AppTextStyles.titleBlackText14
              .copyWith(color: selected ? Colors.white : null),
        ),
      ),
    );
  }
}
