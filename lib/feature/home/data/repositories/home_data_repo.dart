import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/home/data/data_sources/data_sources.dart';
import 'package:e_store/feature/home/data/models/CartResponse.dart';
import 'package:e_store/feature/home/domain/entities/CategoriesEntity.dart';
import 'package:e_store/feature/home/domain/entities/productEntity.dart';
import 'package:e_store/feature/home/domain/repositories/home_domain_repo.dart';



class HomeDataRepo implements HomeDomainRepo{
  HomeDataSources homeDataSources;
  HomeDataRepo(this.homeDataSources);
  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getBrands() {
    return homeDataSources.getBrands();
  }

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories() {
    return homeDataSources.getCategories();
  }

  @override
  Future<Either<Failures, ProductEntity>> getProducts() {
    return homeDataSources.getProducts();
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) {
    return homeDataSources.addToCart(productId);
  }/*
  @override
  Future<List<Product>> getProductss() async {
    final productModels = await homeRemoteDto.fetchProductss();
    return productModels.map((model) => Product.fromModel(model)).toList();
  }
*/
}