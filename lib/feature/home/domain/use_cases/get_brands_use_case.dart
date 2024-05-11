import 'package:dartz/dartz.dart';
import 'package:e_store/feature/home/domain/repositories/home_domain_repo.dart';

import '../../../../core/error/failures.dart';
import '../entities/CategoriesEntity.dart';

class GetBrandsUseCase{
  HomeDomainRepo homeDomainRepo;
  GetBrandsUseCase(this.homeDomainRepo);
  Future<Either<Failures,CategoryOrBrandEntity>> call() => homeDomainRepo.getBrands();

}
