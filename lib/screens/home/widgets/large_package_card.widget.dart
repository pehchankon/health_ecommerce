import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/models/package.model.dart';
import 'package:alemeno_intern/text_styles.dart';
import 'package:alemeno_intern/widgets/custom_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class LargePackageCard extends StatelessWidget {
  LargePackageCard({
    super.key,
    required this.package,
  });
  final PackageModel package;
  late final int numberOfTests = package.tests.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFFD3D3D3),
          width: 0.5.sp,
        ),
      ),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            right: 5.w,
            top: 3.h,
            child: SvgPicture.asset(
              kSafeIcon,
              width: 15.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  kMedicineIcon,
                  width: 15.w,
                ),
                SizedBox(height: 1.5.h),
                Text(
                  package.name,
                  style: AppTextStyles.primaryBlackMediumText18,
                ),
                SizedBox(height: 0.5.h),
                Text(
                  'Includes $numberOfTests tests',
                  style: AppTextStyles.secondaryBlueGreyAltText11,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) => Text(
                    '  • ${package.tests[index].name}',
                    style: AppTextStyles.secondaryBlueGreyAltText11,
                  ),
                ),
                numberOfTests > 2
                    ? Text(
                        'View More',
                        style:
                            AppTextStyles.secondaryBlueGreyAltText11.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      )
                    : const SizedBox(),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹ ${package.hasDiscount! ? package.discountedPrice : package.price}/-',
                      style: AppTextStyles.secondaryDarkCyanSemiBoldText18,
                    ),
                    SizedBox(
                      width: 32.w,
                      child: CustomButton(
                        text: 'Add to cart',
                        onTap: () => print('add to cart'),
                        buttonSize: ButtonSize.medium,
                        isFilled: false,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
