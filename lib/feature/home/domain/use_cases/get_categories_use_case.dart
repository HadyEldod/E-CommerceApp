import 'package:dartz/dartz.dart';
import 'package:e_store/core/error/failures.dart';
import 'package:e_store/feature/home/domain/repositories/home_domain_repo.dart';

import '../entities/CategoriesEntity.dart';

class GetCategoriesUseCase{
  HomeDomainRepo homeDomainRepo;
  GetCategoriesUseCase(this.homeDomainRepo);
Future<Either<Failures,CategoryOrBrandEntity>> call() => homeDomainRepo.getCategories();
}