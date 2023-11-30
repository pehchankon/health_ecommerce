import 'package:alemeno_intern/blocs/shopping_cart.cubit.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/models/shopping_cart.model.dart';
import 'package:alemeno_intern/screens/book_appointment/book_appointment.page.dart';
import 'package:alemeno_intern/widgets/generic_card_outline.widget.dart';
import 'package:alemeno_intern/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class SelectDateCard extends StatefulWidget {
  SelectDateCard({super.key});

  @override
  State<SelectDateCard> createState() => _SelectDateCardState();
}

class _SelectDateCardState extends State<SelectDateCard> {
  String? text;

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
              Expanded(child: _selectDateButton(context)),
              SizedBox(width: 7.w),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector _selectDateButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookAppointmentPage(),
        ),
      ),
      child: GenericCardOutline(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            alignment: Alignment.centerLeft,
            child: BlocBuilder<ShoppingCartCubit, ShoppingCartModel>(
                builder: (context, state) {
              final dateTime = state.bookingDateTime;
              return Text(
                dateTime == null
                    ? 'Select date'
                    : DateFormat('dd/MM/yyyy  (h a)').format(dateTime),
                style: dateTime == null
                    ? AppTextStyles.greyAltText12
                    : AppTextStyles.primaryPurpleMediumText12,
              );
            }),
          ),
        ],
      ),
    );
  }
}
