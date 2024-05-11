import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/sign_up/data/data_sources/sign_up_data_sources.dart';
import 'package:e_store/feature/sign_up/data/models/SignUpModel.dart';

import '../../domain/entities/user_data.dart';

class LocalDataSources implements SignUpDataSources{
  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData) {
    // TODO: implement signup
    throw UnimplementedError();
  }

}