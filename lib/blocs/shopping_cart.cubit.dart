import 'package:alemeno_intern/models/package.model.dart';
import 'package:alemeno_intern/models/shopping_cart.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartModel> {
  ShoppingCartCubit()
      : super(ShoppingCartModel(
          id: 0,
          packages: [],
          bookingDateTime: null,
          hasHardCopy: false,
          totalCost: 0,
          totalDiscountedCost: 0,
        ));

  ShoppingCartModel _addPackageCost(PackageModel package) {
    final _totalCost = state.totalCost + package.price;
    final _totalDiscountedCost = state.totalDiscountedCost +
        (package.hasDiscount! ? package.discountedPrice! : 0);
    return state.copyWith(
      totalCost: _totalCost,
      totalDiscountedCost: _totalDiscountedCost,
    );
  }

  void addToCart(PackageModel package) {
    final updatedPackages = List<PackageModel>.from(state.packages);
    updatedPackages.add(package);
    final updatedState =
        _addPackageCost(package).copyWith(packages: updatedPackages);
    emit(updatedState);
  }

  void addBookingDateTime(DateTime dateTime) {
    final updatedState = state.copyWith(bookingDateTime: dateTime);
    emit(updatedState);
  }

  void updateHasHardCopy(bool _hasHardCopy) {
    final updatedState = state.copyWith(hasHardCopy: _hasHardCopy);
    emit(updatedState);
  }

  void clearCart() {
    emit(ShoppingCartModel(
      id: 0,
      packages: [],
      bookingDateTime: null,
      hasHardCopy: false,
      totalCost: 0,
      totalDiscountedCost: 0,
    ));
  }
}
