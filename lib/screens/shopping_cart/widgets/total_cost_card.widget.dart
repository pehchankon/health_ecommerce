import 'package:alemeno_intern/blocs/shopping_cart.cubit.dart';
import 'package:alemeno_intern/models/package.model.dart';
import 'package:alemeno_intern/widgets/generic_card_outline.widget.dart';
import 'package:alemeno_intern/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class TotalCostCard extends StatelessWidget {
  const TotalCostCard({
    super.key,
    required this.packages,
  });

  final List<PackageModel> packages;

  @override
  Widget build(BuildContext context) {
    final shoppingCartCubit = context.read<ShoppingCartCubit>();
    final totalCost = shoppingCartCubit.state.totalCost;
    final totalDiscountedCost = shoppingCartCubit.state.totalDiscountedCost;
    final totalDiscount = totalCost - totalDiscountedCost;
    return GenericCardOutline(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 3.h),
              _costColumnEntry(
                'M.R.P Total',
                totalCost,
                AppTextStyles.greyAltText12,
              ),
              SizedBox(height: 1.5.h),
              _costColumnEntry(
                'Discount',
                totalDiscount,
                AppTextStyles.greyAltText12,
              ),
              SizedBox(height: 3.h),
              _costColumnEntry(
                'Amount to be paid',
                '₹ $totalDiscountedCost/-',
                AppTextStyles.primaryPurpleBoldText15,
              ),
              SizedBox(height: 5.h),
              _costColumnEntry(
                'Total savings',
                '₹ $totalDiscount/-',
                AppTextStyles.primaryPurpleBoldText15,
                firstTextStyle: AppTextStyles.secondaryDarkBlueGreyText12,
                gap: 6.w,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _costColumnEntry(String text, cost, TextStyle style,
      {TextStyle? firstTextStyle, double? gap}) {
    return Row(
      mainAxisAlignment: gap == null
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        Text(text, style: firstTextStyle ?? style),
        SizedBox(width: gap),
        Text(cost.toString(), style: style),
      ],
    );
  }
}
