import 'package:alemeno_intern/blocs/shopping_cart.cubit.dart';
import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/screens/book_appointment/widgets/date_pick.widget.dart';
import 'package:alemeno_intern/screens/book_appointment/widgets/time_pick.widget.dart';
import 'package:alemeno_intern/text_styles.dart';
import 'package:alemeno_intern/widgets/custom_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({super.key});

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  DateTime? date, time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      bottomNavigationBar: _bottomBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              Text(
                'Select Date',
                style: AppTextStyles.titleBlackBoldText14,
              ),
              SizedBox(height: 1.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: DatePick(
                  onChanged: (DateTime selectedDay) {
                    setState(() => date = selectedDay);
                  },
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Select Time',
                style: AppTextStyles.titleBlackBoldText14,
              ),
              SizedBox(height: 2.h),
              TimePick(
                onChanged: (DateTime selectedTime) {
                  setState(() => time = selectedTime);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _bottomBar(BuildContext context) {
    final shoppingCartCubit = context.read<ShoppingCartCubit>();

    return Container(
      height: 7.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          CustomButton(
            text: 'Confirm',
            onTap: () {
              final dateTime = DateTime(
                date!.year,
                date!.month,
                date!.day,
                time!.hour,
                time!.minute,
              );
              shoppingCartCubit.addBookingDateTime(dateTime);
              Navigator.pop(context);
            },
            isDisabled: date == null || time == null,
            buttonSize: ButtonSize.large,
          ),
        ],
      ),
    );
  }

  AppBar _appBar(context) {
    return AppBar(
      systemOverlayStyle: kSystemUiOverlayStyle,
      title: Text(
        'Book Appointment',
        style: AppTextStyles.titleBlackMediumText20,
      ),
      centerTitle: false,
      leadingWidth: 65,
      leading: GestureDetector(
        child: SvgPicture.asset(
          kBackIcon,
          fit: BoxFit.scaleDown,
        ),
        onTap: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.more_vert,
            color: AppColors.primaryPurpleColor,
          ),
        ),
      ],
    );
  }
}
