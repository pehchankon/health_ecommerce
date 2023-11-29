import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartCubit extends Cubit<List<int>> {
  ShoppingCartCubit() : super([]);

  void addToCart(int id) {
    final updatedState = List<int>.from(state);
    updatedState.add(id);
    emit(updatedState);
  }
}
