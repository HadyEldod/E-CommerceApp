import 'package:dartz/dartz.dart';
import 'package:e_store/feature/sign_up/domain/entities/user_data.dart';
import 'package:e_store/feature/sign_up/domain/repositories/sign_up_domain_repo.dart';

import '../../../../core/error/failures.dart';
import '../entities/SignUpEntity.dart';

class SignUpUseCase {
  SignUpDomainRepo signUpDomainRepo;

  SignUpUseCase(this.signUpDomainRepo);

  Future<Either<Failures, SignUpEntity>> call(UserData userData) =>
      signUpDomainRepo.signUp(userData);
}
