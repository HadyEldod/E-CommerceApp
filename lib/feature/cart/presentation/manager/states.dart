import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/home/data/models/CartResponse.dart';

import '../../../home/data/models/CartResponseee.dart';

abstract class CartStates {}

class CartInitState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {
  CartResponseee cartResponseee;

  CartSuccessState(this.cartResponseee);
}
class CartDeleteItemSuccessState extends CartStates {
  CartResponseee cartResponseee;

  CartDeleteItemSuccessState(this.cartResponseee);
}
class CartUpdateItemSuccessState extends CartStates {
  CartResponseee cartResponseee;

  CartUpdateItemSuccessState(this.cartResponseee);
}

class CartErrorState extends CartStates {
  Failures failures;

  CartErrorState(this.failures);

}
class CartDeleteItemErrorState extends CartStates {
  Failures failures;

  CartDeleteItemErrorState(this.failures);

}
class CartUpdateItemErrorState extends CartStates {
  Failures failures;

  CartUpdateItemErrorState(this.failures);

}
