import 'package:alemeno_intern/blocs/shopping_cart.cubit.dart';
import 'package:alemeno_intern/models/package.model.dart';
import 'package:alemeno_intern/widgets/generic_card_outline.widget.dart';
import 'package:alemeno_intern/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class TotalCostCard extends StatelessWidget {
  TotalCostCard({
    super.key,
    required this.packages,
  });

  final List<PackageModel> packages;

  @override
  Widget build(BuildContext context) {
    final shoppingCartCubit = context.read<ShoppingCartCubit>();
    final _totalCost = shoppingCartCubit.state.totalCost;
    final _totalDiscountedCost = shoppingCartCubit.state.totalDiscountedCost;
    final _totalDiscount = _totalCost - _totalDiscountedCost;
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
                _totalCost,
                AppTextStyles.greyAltText12,
              ),
              SizedBox(height: 1.5.h),
              _costColumnEntry(
                'Discount',
                _totalDiscount,
                AppTextStyles.greyAltText12,
              ),
              SizedBox(height: 3.h),
              _costColumnEntry(
                'Amount to be paid',
                '₹ ${_totalDiscountedCost}/-',
                AppTextStyles.primaryPurpleBoldText15,
              ),
              SizedBox(height: 5.h),
              _costColumnEntry(
                'Total savings',
                '₹ ${_totalDiscount}/-',
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
