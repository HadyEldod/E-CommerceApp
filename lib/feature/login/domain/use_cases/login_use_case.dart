import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/login/domain/entities/login_entity.dart';

import '../repositories/login_domain_repo.dart';

class LoginUseCase {
  LoginDomainRepo loginDomainRepo;

  LoginUseCase(this.loginDomainRepo);

  Future<Either<Failures, LoginEntity>> call(String email, String password) =>
      loginDomainRepo.login(email, password);
}