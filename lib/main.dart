import 'package:bloc/bloc.dart';
import 'package:e_store/app.dart';
import 'package:e_store/config/routes/routes.dart';
import 'package:e_store/core/utils/cache_helper.dart';
import 'package:e_store/core/utils/observer.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
  Bloc.observer=MyBlocObserver();
  var user = CacheHelper.getData("User");
  String route;
  if(user==null){
    route = Routes.login;
  }else{
    route = Routes.home;
  }
  runApp( MyApp(route));
}




