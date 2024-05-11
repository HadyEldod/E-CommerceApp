import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/home/domain/repositories/home_domain_repo.dart';

import '../../data/models/CartResponse.dart';

class AddCartUseCase {
  HomeDomainRepo homeDomainRepo;
  AddCartUseCase(this.homeDomainRepo);

  Future<Either<Failures, CartResponse>> call(String productId) =>
      homeDomainRepo.addToCart(productId);
}