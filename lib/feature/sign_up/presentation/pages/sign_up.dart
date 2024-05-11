import 'package:e_store/feature/sign_up/data/data_sources/remote_data_sources.dart';
import 'package:e_store/feature/sign_up/presentation/manager/cubit.dart';
import 'package:e_store/feature/sign_up/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/components.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(RemoteDataSources()),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpLoadingState) {
            showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  title: CircularProgressIndicator(
                    backgroundColor: Colors.indigo,
                  ),
                ));
          } else if (state is SignUpErrorState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures.message ?? ""),
              ),
            );
          } else if (state is SignUpSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.login, (route) => false);
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
                        controller: SignUpCubit.get(context).nameController,
                        lable: "Full Name",
                        validate: (value) {
                          return null;
                        }),
                    SizedBox(
                      height: 25.h,
                    ),
                    defaultFormField(
                        controller: SignUpCubit.get(context).phoneController,
                        lable: "Mobile Number",
                        validate: (value) {
                          return null;
                        }),
                    SizedBox(
                      height: 25.h,
                    ),
                    defaultFormField(
                        controller: SignUpCubit.get(context).emailController,
                        lable: "E-mail Address",
                        validate: (value) {
                          return null;
                        }),
                    SizedBox(
                      height: 25.h,
                    ),
                    defaultFormField(
                        controller: SignUpCubit.get(context).passwordController,
                        lable: "Password",
                        isPassword: true,
                        validate: (value) {
                          return null;
                        }),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      height: 55.h,
                      child: ElevatedButton(
                        onPressed: () {
                          SignUpCubit.get(context).signUp();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87),
                        child: Text(
                          "Create Account",
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
                          "Have An Account?..",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: Colors.black38),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.login);
                            },
                            child: Text(
                              "Login",
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
      ),
    );
  }
}
