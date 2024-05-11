import 'package:bloc/bloc.dart';
import 'package:e_store/feature/login/data/repositories/login_data_repo.dart';
import 'package:e_store/feature/login/domain/repositories/login_domain_repo.dart';
import 'package:e_store/feature/login/domain/use_cases/login_use_case.dart';
import 'package:e_store/feature/login/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/login_data_Sources.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginDataSources sources;

  LoginCubit(this.sources) : super(LoginIntnState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void login() async {
    emit(LoginLoadingState());
    LoginDomainRepo loginDomainRepo = LoginDataRepo(sources);
    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);
    var result =
       // await loginUseCase.call("loooby@gmail.com","01222738657");
        await loginUseCase.call(emailController.text,passwordController.text);

   result.fold((l) {
     emit(LoginErrorState(l));
   }, (r) {
     emit(LoginSuccessState(r));
   });
  }
}
