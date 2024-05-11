import 'package:bloc/bloc.dart';
import 'package:e_store/feature/cart/data/repositories/cart_data_repo.dart';
import 'package:e_store/feature/cart/domain/repositories/cart_domain_repo.dart';
import 'package:e_store/feature/cart/domain/use_cases/get_cart_use_case.dart';
import 'package:e_store/feature/cart/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/dto.dart';

class CartCubit extends Cubit<CartStates> {
  CartDto cartDto;

  CartCubit(this.cartDto) :super(CartInitState());

  static CartCubit get(context) => BlocProvider.of(context);


  void UpdateItem(String id,int count) async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.update(id,count);
    result.fold((l) {
      print(l.message);
      emit(CartUpdateItemErrorState(l));
    }, (r) {
      emit(CartSuccessState(r));
    });
  }
  void deleteItem(String id) async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.delete(id);
    result.fold((l) {
      print(l.message);
      emit(CartDeleteItemErrorState(l));
    }, (r) {
      emit(CartSuccessState(r));
    });
  }
  void getCart() async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.call();
    result.fold((l) {
      print(l.message);
      emit(CartErrorState(l));
    }, (r) {
      emit(CartSuccessState(r));
    });
  }
}