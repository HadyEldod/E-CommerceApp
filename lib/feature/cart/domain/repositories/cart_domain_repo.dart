import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import '../../../home/data/models/CartResponseee.dart';

abstract class CartDomainRepo{

  Future<Either<Failures,CartResponseee>> getCart();
  Future<Either<Failures,CartResponseee>> deleteItemOfCart(String id);
  Future<Either<Failures,CartResponseee>> update(String id,int count);
}