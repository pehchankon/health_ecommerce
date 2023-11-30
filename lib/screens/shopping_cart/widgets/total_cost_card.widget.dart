import 'package:alemeno_intern/models/package.model.dart';
import 'package:alemeno_intern/widgets/generic_card_outline.widget.dart';
import 'package:alemeno_intern/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TotalCostCard extends StatelessWidget {
  TotalCostCard({
    super.key,
    required this.packages,
  });

  final List<PackageModel> packages;

  @override
  Widget build(BuildContext context) {
    num _totalMRP = 0;
    num _totalDiscount = 0;
    for (final package in packages) {
      _totalMRP = _totalMRP + package.price;
      final discount =
          package.hasDiscount! ? package.price - package.discountedPrice! : 0;
      _totalDiscount = _totalDiscount + discount;
    }

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
                _totalMRP,
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
                '₹ ${_totalMRP - _totalDiscount}/-',
                AppTextStyles.primaryPurpleBoldText15,
              ),
              SizedBox(height: 5.h),
              _costColumnEntry(
                'Total savings',
                '₹ $_totalDiscount/-',
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
