import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/home/data/models/CartResponse.dart';

import '../../../home/data/models/CartResponseee.dart';
import '../repositories/cart_domain_repo.dart';

class CartUseCase{
  CartDomainRepo cartDomainRepo;
  CartUseCase(this.cartDomainRepo);
  Future<Either<Failures,CartResponseee>>call()=>cartDomainRepo.getCart();
  Future<Either<Failures,CartResponseee>>delete(String id)=>cartDomainRepo.deleteItemOfCart(id);
  Future<Either<Failures,CartResponseee>>update(String id,int count)=>cartDomainRepo.update(id,count);
}