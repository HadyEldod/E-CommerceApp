import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/home/domain/entities/CategoriesEntity.dart';
import 'package:e_store/feature/home/domain/entities/productEntity.dart';

import '../../data/models/CartResponse.dart';
import '../../data/models/CartResponseee.dart';

abstract class HomeDomainRepo{
  Future<Either<Failures,CategoryOrBrandEntity>>getCategories();
  Future<Either<Failures,CategoryOrBrandEntity>>getBrands();
  Future<Either<Failures,ProductEntity>>getProducts();
  Future<Either<Failures,CartResponse>>addToCart(String productId);
 // Future<List<Product>> getProductss();

}