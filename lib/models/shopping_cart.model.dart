import 'package.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_cart.model.freezed.dart';

@Freezed()
class ShoppingCartModel with _$ShoppingCartModel {
  factory ShoppingCartModel({
    required final int id,
    required final List<PackageModel> packages,
    @Default({}) final Set<int> packagesAdded,
    final DateTime? bookingDateTime,
    required final bool hasHardCopy,
    required final num totalCost,
    required final num totalDiscountedCost,
  }) = _ShoppingCartModel;
}
