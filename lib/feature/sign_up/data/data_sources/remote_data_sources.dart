import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_store/core/api/end_points.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/core/utils/constants.dart';
import 'package:e_store/feature/sign_up/data/data_sources/sign_up_data_sources.dart';
import 'package:e_store/feature/sign_up/data/models/SignUpModel.dart';

import '../../domain/entities/user_data.dart';

class RemoteDataSources implements SignUpDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData) async {
    try {
      var response =
          await dio.post("${Constants.baseApiUrl}${EndPoints.signUp}", data: {

         "name": userData.name,
         "email": userData.email,
         "password": userData.password,
         "rePassword": userData.password,
         "phone": userData.phone,
      });
      SignUpModel signUpModel = SignUpModel.fromJson(response.data);
      return Right(signUpModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
