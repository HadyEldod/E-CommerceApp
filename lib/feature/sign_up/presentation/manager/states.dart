import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/sign_up/domain/entities/SignUpEntity.dart';

abstract class SignUpStates {}

class SignUpIntnState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  SignUpEntity signUpEntity;
  SignUpSuccessState(this.signUpEntity);
}

class SignUpErrorState extends SignUpStates {
  Failures failures;
  SignUpErrorState(this.failures);
}
