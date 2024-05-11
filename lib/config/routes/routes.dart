import 'package:e_store/feature/cart/presentation/pages/cart_screen.dart';
import 'package:e_store/feature/home/domain/entities/CategoriesEntity.dart';
import 'package:e_store/feature/home/domain/entities/productEntity.dart';
import 'package:e_store/feature/home/presentation/pages/cat_screen.dart';
import 'package:e_store/feature/home/presentation/pages/search.dart';
import 'package:e_store/feature/login/data/data_sources/login_data_Sources.dart';
import 'package:e_store/feature/login/domain/entities/login_entity.dart';
import 'package:e_store/feature/login/presentation/manager/cubit.dart';
import 'package:e_store/feature/login/presentation/pages/login.dart';
import 'package:e_store/feature/product_details/presentation/pages/product_screen.dart';
import 'package:e_store/feature/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/components.dart';
import '../../feature/home/presentation/pages/home.dart';

class Routes {
 // static const String splash = "";
  static const String login = "/";
  static const String signUp = "signUp";
  static const String home = "homeScreen";
  static const String productScreen = "productScreen";
  static const String cart = "cart";
  static const String catScreen = "catScreen";
  static const String searchScreen = "searchScreen";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => LoginCubit(RemoteDto()),
                child: const LoginScreen()));
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.home:
        //   LoginEntity loginEntity = routeSettings.arguments as LoginEntity;
        return MaterialPageRoute(
            builder: (context) => HomeScreen(/*loginEntity*/));
      case Routes.productScreen:
        ProductDataEntity productDataEntity =
            routeSettings.arguments as ProductDataEntity;
        return MaterialPageRoute(
            builder: (context) => ProductScreen(productDataEntity));
      case Routes.cart:
        return MaterialPageRoute(builder: (context) => const CartScreen());
      case Routes.catScreen:
        DataEntity dataEntity=
        routeSettings.arguments as DataEntity;
        return MaterialPageRoute(builder: (context) =>  CatScreen(dataEntity));
      case Routes.searchScreen:
        final searchWord = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => SearchScreen(searchWord: searchWord),);
      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute());
    }
  }
}
