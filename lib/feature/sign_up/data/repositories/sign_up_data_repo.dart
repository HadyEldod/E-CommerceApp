import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/sign_up/data/data_sources/sign_up_data_sources.dart';
import 'package:e_store/feature/sign_up/domain/entities/SignUpEntity.dart';
import 'package:e_store/feature/sign_up/domain/repositories/sign_up_domain_repo.dart';
import '../../domain/entities/user_data.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  SignUpDataSources sources;
  SignUpDataRepo(this.sources);

  @override
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData) =>
      sources.signUp(userData);
}
