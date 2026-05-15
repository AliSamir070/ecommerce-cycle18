import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brands_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/home_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUsecase {
  final HomeTabRepository _repository;
  const GetAllBrandsUsecase(this._repository);

  Future<ApiResult<List<BrandsEntity>>> call() async =>
      _repository.getAllBrands();
}
