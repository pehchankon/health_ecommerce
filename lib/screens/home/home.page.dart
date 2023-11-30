import 'package:alemeno_intern/blocs/shopping_cart.cubit.dart';
import 'package:alemeno_intern/colors.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/data/data_repository.dart';
import 'package:alemeno_intern/models/package.model.dart';
import 'package:alemeno_intern/models/shopping_cart.model.dart';
import 'package:alemeno_intern/screens/shopping_cart/shopping_cart.page.dart';
import 'package:alemeno_intern/text_styles.dart';
import 'package:alemeno_intern/screens/home/widgets/large_package_card.widget.dart';
import 'package:alemeno_intern/screens/home/widgets/small_package_card.widget.dart';
import 'package:alemeno_intern/widgets/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<PackageModel> packages;
  late final DataRepository dataRepository;
  late final PackageModel package;
  bool isLoading = true;

  @override
  void initState() {
    dataRepository = RepositoryProvider.of<DataRepository>(context);
    _init();
    super.initState();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 2));
    packages = await dataRepository.fetchAllLabTests();
    package = (await dataRepository.fetchAllPackages())[0];
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final shoppingCartCubit = context.read<ShoppingCartCubit>();

    return Scaffold(
      appBar: _appBar(shoppingCartCubit, context),
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
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
                        const Expanded(child: SizedBox()),
                        _viewMoreButton(),
                        SizedBox(width: 1.w),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 11.5.sp,
                          color: const Color(0xFF10217D),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.h),
                    Padding(
                      padding: EdgeInsets.all(3.w),
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
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
        BlocBuilder<ShoppingCartCubit, ShoppingCartModel>(
            builder: (context, state) {
          return state.packages.isNotEmpty
              ? Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(3.5.sp),
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryCyanColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    state.packages.length.toString(),
                    style: AppTextStyles.primaryPurpleBoldText8,
                  ),
                )
              : const SizedBox();
        }),
        BlocBuilder<ShoppingCartCubit, ShoppingCartModel>(
            builder: (context, state) {
          return GestureDetector(
            onTap: () => state.packages.isNotEmpty
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShoppingCartPage(),
                    ),
                  )
                : null,
            child: const Icon(
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
