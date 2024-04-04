import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<double>> {
  CartCubit() : super([]);

  void addToCart(double price) {
    state.add(price);
    emit(List.from(state));
  }

  double get total => state.reduce((value, element) => value + element);
}
