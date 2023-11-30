import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/models/package.model.dart';
import 'package:alemeno_intern/widgets/generic_card_outline.widget.dart';
import 'package:alemeno_intern/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CartPackageCard extends StatelessWidget {
  CartPackageCard({
    super.key,
    required this.packages,
  });

  final List<PackageModel> packages;

  @override
  Widget build(BuildContext context) {
    return GenericCardOutline(
      children: [
        Container(
          alignment: Alignment.center,
          height: 5.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryPurpleColor.withOpacity(0.8),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(5),
            ),
          ),
          child: Text(
            'Pathology Tests',
            style: AppTextStyles.primaryWhiteBoldText14,
          ),
        ),
        _body(),
      ],
    );
  }

  Padding _body() {
    final _length = packages.length;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _length,
        itemBuilder: (context, index) {
          final package = packages[index];
          return SizedBox(
            height: (index == 0 ? 22.h : 17.h) +
                (_length > 0 ? 3.h * (_length - 1) : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: index == 0 ? 6.5.h : 1.5.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      package.name,
                      style: AppTextStyles.secondaryDarkBlueGreySemiBoldText15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '₹ ${package.hasDiscount! ? package.discountedPrice : package.price}/-',
                          style: AppTextStyles.secondaryDarkCyanSemiBoldText16,
                        ),
                        package.hasDiscount!
                            ? Text(
                                package.price.toString(),
                                style: AppTextStyles.greyText11.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                CircularCustomButton(text: 'Remove', icon: kDeleteIcon),
                SizedBox(height: 1.h),
                CircularCustomButton(
                  text: 'Upload prescription (optional)',
                  icon: kUploadIcon,
                ),
                index != _length - 1
                    ? Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Divider(thickness: 1),
                      )
                    : SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CircularCustomButton extends StatelessWidget {
  const CircularCustomButton({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(4.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 2,
            color: AppColors.primaryPurpleColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 2.w),
            SvgPicture.asset(icon),
            SizedBox(width: 4.w),
            Text(
              text,
              style: AppTextStyles.primaryPurpleMediumText13,
            ),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
