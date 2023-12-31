import 'package:alemeno_intern/blocs/shopping_cart.cubit.dart';
import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/data/notification_client.dart';
import 'package:alemeno_intern/models/shopping_cart.model.dart';
import 'package:alemeno_intern/screens/booking_success/booking_success.page.dart';
import 'package:alemeno_intern/screens/shopping_cart/widgets/hard_copy_report_card.widget.dart';
import 'package:alemeno_intern/screens/shopping_cart/widgets/select_date_card.widget.dart';
import 'package:alemeno_intern/screens/shopping_cart/widgets/total_cost_card.widget.dart';
import 'package:alemeno_intern/text_styles.dart';
import 'package:alemeno_intern/screens/shopping_cart/widgets/cart_package_card.widget.dart';
import 'package:alemeno_intern/widgets/custom_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    final shoppingCartCubit = context.read<ShoppingCartCubit>();
    final notificationClient =
        Provider.of<NotificationClient>(context, listen: false);
    final packages = shoppingCartCubit.state.packages;

    return Scaffold(
      appBar: _appBar(context),
      bottomNavigationBar: _bottomBar(shoppingCartCubit, notificationClient),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              Text(
                'Order review',
                style: AppTextStyles.primaryPurpleMediumText20,
              ),
              SizedBox(height: 1.h),
              SizedBox(
                height: (5.h + 18.h * packages.length) +
                    (packages.isNotEmpty ? 3.h * (packages.length - 1) : 0),
                child: CartPackageCard(
                  packages: packages,
                ),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                height: 10.h,
                child: const SelectDateCard(),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                height: 23.h,
                child: TotalCostCard(packages: packages),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                height: 15.h,
                child: const HardCopyReportCard(),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }

  Container _bottomBar(
    ShoppingCartCubit shoppingCartCubit,
    NotificationClient notificationClient,
  ) {
    return Container(
      height: 7.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          BlocBuilder<ShoppingCartCubit, ShoppingCartModel>(
              builder: (context, state) {
            return CustomButton(
              text: 'Schedule',
              onTap: () {
                final orderDetails = shoppingCartCubit.state;
                shoppingCartCubit.sendNotification(notificationClient);
                shoppingCartCubit.clearCart();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingSuccessPage(
                      orderDetails: orderDetails,
                    ),
                  ),
                );
              },
              isDisabled: state.bookingDateTime == null,
              buttonSize: ButtonSize.large,
            );
          }),
        ],
      ),
    );
  }

  AppBar _appBar(context) {
    return AppBar(
      systemOverlayStyle: kSystemUiOverlayStyle,
      title: Text(
        'My cart',
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
