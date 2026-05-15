import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/categories_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/home_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUsecase {
  final HomeTabRepository _repository;
  const GetAllCategoriesUsecase(this._repository);

  Future<ApiResult<List<CategoriesEntity>>> call() async {
    return _repository.getAllCategories();
  }
}
