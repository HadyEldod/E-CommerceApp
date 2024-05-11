import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/cart/data/data_sources/dto.dart';
import 'package:e_store/feature/cart/domain/repositories/cart_domain_repo.dart';
import 'package:e_store/feature/home/data/models/CartResponse.dart';

import '../../../home/data/models/CartResponseee.dart';

class CartDataRepo implements CartDomainRepo{
  CartDto cartDto;

  CartDataRepo(this.cartDto);

  @override
  Future<Either<Failures, CartResponseee>> getCart() {
return cartDto.getCart();
  }

  @override
  Future<Either<Failures, CartResponseee>> deleteItemOfCart(String id) {
    return  cartDto.deleteItemOfCart(id);
  }

  @override
  Future<Either<Failures, CartResponseee>> update(String id, int count) {
    return cartDto.update(id, count);
  }

}