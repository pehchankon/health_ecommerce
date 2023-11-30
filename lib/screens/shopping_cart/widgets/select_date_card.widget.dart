import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/widgets/generic_card_outline.widget.dart';
import 'package:alemeno_intern/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SelectDateCard extends StatelessWidget {
  SelectDateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericCardOutline(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: 4.w),
              SvgPicture.asset(kCalendarIcon),
              SizedBox(width: 3.w),
              Expanded(child: _selectDateButton()),
              SizedBox(width: 7.w),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector _selectDateButton() {
    return GestureDetector(
      onTap: () => print('date'),
      child: GenericCardOutline(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            alignment: Alignment.centerLeft,
            child: Text(
              'Select date',
              style: AppTextStyles.greyAltText12,
            ),
          ),
        ],
      ),
    );
  }
}
