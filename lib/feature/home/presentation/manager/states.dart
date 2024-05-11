import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/home/data/models/CartResponse.dart';
import 'package:e_store/feature/home/domain/entities/CategoriesEntity.dart';
import 'package:e_store/feature/home/domain/entities/productEntity.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeLoadingState extends HomeStates {}


class HomeGetBrandsSuccessState extends HomeStates {
  CategoryOrBrandEntity model;
  HomeGetBrandsSuccessState(this.model);
}

class HomeGetCategoriesSuccessState extends HomeStates {
  CategoryOrBrandEntity model;
  HomeGetCategoriesSuccessState(this.model);
}
class HomeGetProductsSuccessState extends HomeStates {
  ProductEntity model;
  HomeGetProductsSuccessState(this.model);
}

class HomeGetBrandsErrorState extends HomeStates {
  Failures failures;

  HomeGetBrandsErrorState(this.failures);
}

class HomeGetCategoriesErrorState extends HomeStates {
  Failures failures;

  HomeGetCategoriesErrorState(this.failures);
}
class HomeGetProductsErrorState extends HomeStates {
  Failures failures;

  HomeGetProductsErrorState(this.failures);
}
class ChangeBottomNavBar extends HomeStates {}
class SetCategoriesState extends HomeStates {}
class AddToCartLoadingState extends HomeStates {

}
class AddToCartSuccessState extends HomeStates {
  CartResponse cartResponse;
  AddToCartSuccessState(this.cartResponse);
}
class AddToCartErrorState extends HomeStates {
  Failures failures;
  AddToCartErrorState(this.failures);

}
