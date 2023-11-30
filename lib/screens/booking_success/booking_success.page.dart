import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/models/shopping_cart.model.dart';
import 'package:alemeno_intern/textStyles.dart';
import 'package:alemeno_intern/widgets/custom_button.widget.dart';
import 'package:alemeno_intern/widgets/generic_card_outline.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class BookingSuccessPage extends StatelessWidget {
  BookingSuccessPage({
    super.key,
    required this.orderDetails,
  });
  final ShoppingCartModel orderDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      bottomNavigationBar: _bottomBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          child: SizedBox(
            height: 50.h,
            child: GenericCardOutline(
              children: [_body()],
            ),
          ),
        ),
      ),
    );
  }

  Padding _body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.2.w),
      child: Column(
        children: [
          SizedBox(height: 5.h),
          SvgPicture.asset(kScheduleSuccessIcon),
          Expanded(child: SizedBox()),
          Text(
            'Lab tests have been scheduled successfully, You will receive a mail of the same.',
            style: AppTextStyles.secondaryDarkBlueGreyText18,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          Text(
            DateFormat('d MMM yyyy  |  h a')
                .format(orderDetails.bookingDateTime!),
            style: AppTextStyles.greyAltText16,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 7.h),
        ],
      ),
    );
  }

  Container _bottomBar(BuildContext context) {
    return Container(
      height: 7.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          CustomButton(
            text: 'Back to home',
            onTap: () => Navigator.pop(context),
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
        'Success',
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
          icon: Icon(
            Icons.more_vert,
            color: AppColors.primaryPurpleColor,
          ),
        ),
      ],
    );
  }
}
