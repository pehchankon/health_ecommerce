import 'package:alemeno_intern/data/notification_client.dart';
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
    final totalCost = state.totalCost + package.price;
    final totalDiscountedCost = state.totalDiscountedCost +
        (package.hasDiscount! ? package.discountedPrice! : 0);
    return state.copyWith(
      totalCost: totalCost,
      totalDiscountedCost: totalDiscountedCost,
    );
  }

  void addToCart(PackageModel package) {
    final updatedPackages = List<PackageModel>.from(state.packages);
    final updatedPackagesAdded = Set<int>.from(state.packagesAdded);
    updatedPackages.add(package);
    updatedPackagesAdded.add(package.id);
    final updatedState = _addPackageCost(package).copyWith(
      packages: updatedPackages,
      packagesAdded: updatedPackagesAdded,
    );
    emit(updatedState);
  }

  void addBookingDateTime(DateTime dateTime) {
    final updatedState = state.copyWith(bookingDateTime: dateTime);
    emit(updatedState);
  }

  void updateHasHardCopy(bool hasHardCopy) {
    final updatedState = state.copyWith(hasHardCopy: hasHardCopy);
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

  bool packageExistsInCart(int packageId) {
    return state.packagesAdded.contains(packageId);
  }

  void sendNotification(NotificationClient client) {
    String message = 'Thank you for purchasing ';
    for (final package in state.packages) {
      message += '${package.name}, ';
    }
    client.sendNotification('${message.substring(0, message.length - 2)}!');
  }
}
