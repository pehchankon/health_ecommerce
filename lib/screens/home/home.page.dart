import 'package:alemeno_intern/blocs/shopping_cart.bloc.dart';
import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/models/package.model.dart';
import 'package:alemeno_intern/models/test.model.dart';
import 'package:alemeno_intern/screens/shopping_cart/shopping_cart.page.dart';
import 'package:alemeno_intern/textStyles.dart';
import 'package:alemeno_intern/widgets/large_package_card.widget.dart';
import 'package:alemeno_intern/widgets/small_package_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
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
      appBar: _appBar(shoppingCartCubit, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              Row(
                children: [
                  Text(
                    'Popular lab tests',
                    style: AppTextStyles.primaryPurpleMediumText20,
                  ),
                  Expanded(child: SizedBox()),
                  _viewMoreButton(),
                  SizedBox(width: 1.w),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 11.5.sp,
                    color: Color(0xFF10217D),
                  ),
                ],
              ),
              SizedBox(height: 0.5.h),
              Padding(
                padding: EdgeInsets.all(3.w),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7.w,
                    mainAxisSpacing: 2.h,
                    childAspectRatio: 0.63.sp,
                  ),
                  itemCount: packages.length,
                  itemBuilder: (context, index) =>
                      SmallPackageCard(package: packages[index]),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Popular Packages',
                style: AppTextStyles.primaryPurpleMediumText20,
              ),
              SizedBox(height: 2.h),
              Center(
                child: SizedBox(
                  width: 75.w,
                  child: LargePackageCard(
                    package: package,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _viewMoreButton() {
    return GestureDetector(
      onTap: () => print('view more'),
      child: Text(
        'View more',
        style: AppTextStyles.primaryPurpleMediumText11.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  AppBar _appBar(shoppingCartCubit, context) {
    return AppBar(
      systemOverlayStyle: kSystemUiOverlayStyle,
      title: Text(
        'Logo',
        style: AppTextStyles.titleBlackMediumText20,
      ),
      centerTitle: true,
      actions: [
        BlocBuilder<ShoppingCartCubit, List<PackageModel>>(
            builder: (context, state) {
          return state.length > 0
              ? Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(3.5.sp),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryCyanColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    state.length.toString(),
                    style: AppTextStyles.primaryPurpleBoldText8,
                  ),
                )
              : SizedBox();
        }),
        BlocBuilder<ShoppingCartCubit, List<PackageModel>>(
            builder: (context, state) {
          return GestureDetector(
            onTap: () => state.length > 0
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCartPage(),
                    ),
                  )
                : null,
            child: Icon(
              Icons.shopping_cart_rounded,
              color: AppColors.primaryPurpleColor,
            ),
          );
        }),
        SizedBox(width: 5.w),
      ],
    );
  }
}
