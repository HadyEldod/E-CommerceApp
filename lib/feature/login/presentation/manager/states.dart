
import 'package:e_store/feature/login/domain/entities/login_entity.dart';

import '../../../../core/error/failures.dart';

abstract class LoginStates {}

class LoginIntnState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginEntity loginEntity;
  LoginSuccessState(this.loginEntity);
}

class LoginErrorState extends LoginStates {
  Failures failures;
  LoginErrorState(this.failures);
}
