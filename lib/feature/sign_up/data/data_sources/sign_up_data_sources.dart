import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/sign_up/data/models/SignUpModel.dart';

import '../../domain/entities/user_data.dart';

abstract class SignUpDataSources{
  Future<Either<Failures,SignUpModel>>signUp(UserData userData);
}