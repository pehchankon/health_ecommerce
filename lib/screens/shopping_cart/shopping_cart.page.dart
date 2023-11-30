import 'package:alemeno_intern/blocs/shopping_cart.bloc.dart';
import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/models/package.model.dart';
import 'package:alemeno_intern/models/test.model.dart';
import 'package:alemeno_intern/textStyles.dart';
import 'package:alemeno_intern/screens/shopping_cart/widgets/cart_package_card.widget.dart';
import 'package:alemeno_intern/widgets/custom_button.widget.dart';
import 'package:alemeno_intern/widgets/large_package_card.widget.dart';
import 'package:alemeno_intern/widgets/small_package_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({super.key});
  late final List<PackageModel> packages = [
    package,
    package,
    package,
    package,
  ];
  final package = PackageModel(
    id: 0,
    name: 'Thyroid Profile',
    tests: [
      TestModel(id: 0, name: 'name'),
      TestModel(id: 0, name: 'name'),
    ],
    durationInHours: 24,
    price: 1400,
    discountedPrice: 1000,
    hasDiscount: true,
  );

  @override
  Widget build(BuildContext context) {
    final shoppingCartCubit = context.read<ShoppingCartCubit>();

    return Scaffold(
      appBar: _appBar(context),
      bottomNavigationBar: _bottomBar(),
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
                height: 22.h,
                child: CartPackageCard(
                  package: packages[0],
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

  Container _bottomBar() {
    return Container(
      height: 6.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          CustomButton(
            text: 'Schedule',
            onTap: () {},
            isDisabled: true,
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
        'My Cart',
        style: AppTextStyles.titleBlackMediumText20,
      ),
      centerTitle: false,
      leadingWidth: 70,
      leading: GestureDetector(
        child: SvgPicture.asset(
          kBackIcon,
          fit: BoxFit.scaleDown,
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}
