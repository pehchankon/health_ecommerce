import 'package:alemeno_intern/blocs/shopping_cart.cubit.dart';
import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/models/package.model.dart';
import 'package:alemeno_intern/models/shopping_cart.model.dart';
import 'package:alemeno_intern/text_styles.dart';
import 'package:alemeno_intern/widgets/custom_button.widget.dart';
import 'package:alemeno_intern/widgets/generic_card_outline.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SmallPackageCard extends StatelessWidget {
  SmallPackageCard({super.key, required this.package});

  final PackageModel package;
  late final int numberOfTests = package.tests.length;

  @override
  Widget build(BuildContext context) {
    final shoppingCartCubit = context.read<ShoppingCartCubit>();

    return GenericCardOutline(
      children: [
        _verifiedIcon(),
        _cardHeader(),
        _body(shoppingCartCubit),
      ],
    );
  }

  Padding _body(ShoppingCartCubit shoppingCartCubit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.5.h),
          Text(
            'Includes $numberOfTests tests',
            style: AppTextStyles.secondaryBlueGreyText11,
          ),
          SizedBox(height: 2.h),
          Text(
            'Get reports in ${package.durationInHours} hours',
            style: AppTextStyles.secondaryBlueGreyText7,
          ),
          SizedBox(height: 0.5.h),
          Row(
            children: [
              Text(
                '₹ ${package.hasDiscount! ? package.discountedPrice : package.price}',
                style: AppTextStyles.primaryPurpleBoldText10,
              ),
              SizedBox(width: 2.w),
              package.hasDiscount!
                  ? Text(
                      package.price.toString(),
                      style: AppTextStyles.greyText6.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const Expanded(child: SizedBox()),
          BlocBuilder<ShoppingCartCubit, ShoppingCartModel>(
              builder: (context, state) {
            return CustomButton(
              text: 'Add to cart',
              onTap: () async {
                await Future.delayed(const Duration(seconds: 1));
                shoppingCartCubit.addToCart(package);
              },
              buttonTapBehaviour: ButtonTapBehaviour.action,
              loadingText: 'Adding to cart',
              finishedText: 'Added to cart',
              isOneTimeAction: true,
              isFinished: shoppingCartCubit.packageExistsInCart(package.id),
            );
          }),
          SizedBox(height: 0.4.h),
          CustomButton(
            text: 'View Details',
            isFilled: false,
            onTap: () => print('details'),
            buttonTapBehaviour: ButtonTapBehaviour.transition,
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }

  Container _cardHeader() {
    return Container(
      alignment: Alignment.center,
      height: 3.5.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryPurpleColor.withOpacity(0.8),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(5),
        ),
      ),
      child: Text(
        package.name,
        style: AppTextStyles.primaryWhiteBoldText10,
      ),
    );
  }

  Positioned _verifiedIcon() {
    return Positioned(
      right: 2.w,
      top: 5.h,
      child: SvgPicture.asset(
        kVerifiedIcon,
        width: 8.w,
      ),
    );
  }
}
