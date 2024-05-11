import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/home/domain/entities/productEntity.dart';
import 'package:e_store/feature/home/domain/repositories/home_domain_repo.dart';

class GetProductUseCase{
HomeDomainRepo homeDomainRepo;
GetProductUseCase(this.homeDomainRepo);

  Future<Either<Failures,ProductEntity>>call() => homeDomainRepo.getProducts();
}