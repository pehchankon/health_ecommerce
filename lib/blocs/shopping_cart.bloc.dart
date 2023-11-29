import 'package:alemeno_intern/models/package.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartCubit extends Cubit<List<PackageModel>> {
  ShoppingCartCubit() : super([]);

  void addToCart(PackageModel package) {
    final updatedState = List<PackageModel>.from(state);
    updatedState.add(package);
    emit(updatedState);
  }
}
