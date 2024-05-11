import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_store/core/api/end_points.dart';
import 'package:e_store/core/utils/cache_helper.dart';
import 'package:e_store/core/utils/constants.dart';
import 'package:e_store/feature/home/data/models/CartResponse.dart';
import 'package:e_store/feature/home/data/models/CategoryOrBrandModel.dart';
import 'package:e_store/feature/home/data/models/ProductModel.dart';

import '../../../../core/error/failures.dart';

abstract class HomeDataSources {
  Future<Either<Failures, CategoryOrBrandModel>> getCategories();

  Future<Either<Failures, CategoryOrBrandModel>> getBrands();

  Future<Either<Failures, ProductModel>> getProducts();

  Future<Either<Failures, CartResponse>> addToCart(String productId);
 // Future<List<ProductModel>> fetchProductss();

}

class HomeRemoteDto implements HomeDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() async {
    try {
      var response = await dio.get(
        "${Constants.baseApiUrl}${EndPoints.GetAllBrands}",
      );
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() async {
    try {
      var response = await dio.get(
        "${Constants.baseApiUrl}${EndPoints.GetAllCategories}",
      );
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      var response = await dio.get(
        "${Constants.baseApiUrl}${EndPoints.GetAllProducts}",
      );
      ProductModel model = ProductModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) async {
    var userToken=CacheHelper.getData("User");
    try {
      var response = await dio.post(
        "${Constants.baseApiUrl}${EndPoints.AddToCart}",
        options: Options(
          headers: {
            "token":userToken
          }
        ),data: {
          "productId":productId
      }
      );
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
/*
  @override
  Future<List<ProductModel>> fetchProductss() async {
    final response = await dio.get('https://ecommerce.routemisr.com/api/v1/products');
    if (response.statusCode == 200) {
      final data = response.data['data'] as List;
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
*/
}

class HomeLocalDto implements HomeDataSources {
  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

 /* @override
  Future<List<ProductModel>> fetchProductss() {
    // TODO: implement fetchProducts
    throw UnimplementedError();
  }*/
}
