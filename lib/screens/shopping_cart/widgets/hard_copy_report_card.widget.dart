import 'package:alemeno_intern/blocs/shopping_cart.cubit.dart';
import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/models/shopping_cart.model.dart';
import 'package:alemeno_intern/text_styles.dart';
import 'package:alemeno_intern/widgets/generic_card_outline.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class HardCopyReportCard extends StatelessWidget {
  const HardCopyReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingCartCubit = context.read<ShoppingCartCubit>();

    return BlocBuilder<ShoppingCartCubit, ShoppingCartModel>(
        builder: (context, state) {
      final selected = state.hasHardCopy;
      return GestureDetector(
        onTap: () => shoppingCartCubit.updateHasHardCopy(!selected),
        child: GenericCardOutline(
          children: [
            Positioned(
              top: 2.2.h,
              left: 3.w,
              child: _toggleBox(selected),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h),
                  Text(
                    'Hard copy of reports',
                    style: AppTextStyles.secondaryDarkBlueGreyText11,
                  ),
                  Text(
                    'Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched.\n\n₹150 per person',
                    style: AppTextStyles.greyAltText10p5,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Container _toggleBox(bool selected) {
    return Container(
      alignment: Alignment.center,
      width: 10.sp,
      height: 10.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? AppColors.primaryPurpleColor : Colors.transparent,
        border: Border.all(
          color: selected
              ? AppColors.primaryPurpleColor
              : AppColors.lighGreyColor,
          width: 0.5,
        ),
      ),
      child: selected ? SvgPicture.asset(kCheckIcon) : null,
    );
  }
}
