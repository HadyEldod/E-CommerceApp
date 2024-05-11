import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/login/domain/entities/login_entity.dart';
import 'package:e_store/feature/login/domain/repositories/login_domain_repo.dart';

import '../data_sources/login_data_Sources.dart';

class LoginDataRepo implements LoginDomainRepo {
  LoginDataSources loginDataSources;

  LoginDataRepo(this.loginDataSources);

  @override
  Future<Either<Failures, LoginEntity>> login(String email, String password) =>
      loginDataSources.login(email, password);
}
