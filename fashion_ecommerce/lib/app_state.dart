import 'package:fashion_ecommerce/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<Order>> {
  CartCubit() : super([]);

  void increment(Order order) {
    List<Order> updatedList = List.from(state);
    updatedList.add(order);

    emit(updatedList);
  }

  void decrement(int id) {
    List<Order> updatedList = List.from(state);
    updatedList.removeWhere((element) => element.product.id == id);

    emit(updatedList);
  }
}
