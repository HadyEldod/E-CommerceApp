import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_store/core/utils/cache_helper.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/CartResponse.dart';
import '../../../home/data/models/CartResponseee.dart';

abstract class CartDto {
  Future<Either<Failures, CartResponseee>> getCart();

  Future<Either<Failures, CartResponseee>> deleteItemOfCart(String id);

  Future<Either<Failures, CartResponseee>> update(String id, int count);
}

class RemoteCartDto implements CartDto {
  Dio dio = Dio();
  var token = CacheHelper.getData("User");

  @override
  Future<Either<Failures, CartResponseee>> getCart() async {
    try {
      var response = await dio.get(
          "${Constants.baseApiUrl}${EndPoints.AddToCart}",
          options: Options(headers: {"token": token}));
      print(response.data);
      print(response.statusCode);
      CartResponseee cartResponseee = CartResponseee.fromJson(response.data);
      return Right(cartResponseee);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponseee>> deleteItemOfCart(String id) async {
    try {
      var response = await dio.delete(
          "${Constants.baseApiUrl}${EndPoints.AddToCart}/$id",
          options: Options(headers: {"token": token}));
      CartResponseee cartResponseee = CartResponseee.fromJson(response.data);
      return Right(cartResponseee);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponseee>> update(String id, int count) async {
    try {
      var response = await dio.put(
        "${Constants.baseApiUrl}${EndPoints.AddToCart}/$id",
        options: Options(
          headers: {"token": token},
        ),
        data: {"count": count},
      );
      CartResponseee cartResponseee = CartResponseee.fromJson(response.data);
      return Right(cartResponseee);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }


}

class LocalCartDto implements CartDto {
  @override
  Future<Either<Failures, CartResponseee>> getCart() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponseee>> deleteItemOfCart(String id) {
    // TODO: implement deleteItemOfCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponseee>> update(String id, int count) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
