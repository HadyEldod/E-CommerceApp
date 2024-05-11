import 'package:dartz/dartz.dart';
import 'package:e_store/feature/sign_up/domain/entities/SignUpEntity.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_data.dart';

abstract class SignUpDomainRepo {
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData);
}
