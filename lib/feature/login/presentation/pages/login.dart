import 'package:e_store/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/components.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit, LoginStates>  (
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pop(context);
          CacheHelper.savaData(key: "User", value: state.loginEntity.token);
          Navigator.pushNamedAndRemoveUntil(context, Routes.home,
              arguments: state.loginEntity,
                  (route) => false);
        } else if (state is LoginLoadingState) {
          showDialog(
              context: context,
              builder: (context) =>
              const AlertDialog(
                backgroundColor: Colors.transparent,
                title: Center(
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ),
                ),
              ));
        } else if (state is LoginErrorState) {
          showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    title: Text("Error"),
                    content: Text(state.failures.message),
                  ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Center(
                      child: Text(
                        "Welcome To My \n E-Commerce  App",
                        style: GoogleFonts.almendra(
                          textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  defaultFormField(
                      controller: LoginCubit
                          .get(context)
                          .emailController,
                      lable: "E-mail Address",
                      validate: (value) {
                        return null;
                      }),
                  SizedBox(
                    height: 60.h,
                  ),
                  defaultFormField(
                      controller: LoginCubit
                          .get(context)
                          .passwordController,
                      lable: "Password",
                      isPassword: true,
                      validate: (value) {
                        return null;
                      }),
                  SizedBox(
                    height: 70.h,
                  ),
                  SizedBox(
                    height: 55.h,
                    child: ElevatedButton(
                      onPressed: () {
                        LoginCubit.get(context).login();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87),
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have An Account?..",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: Colors.black38),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signUp);
                          },
                          child: Text(
                            "Create One",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                color: Colors.black87),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
