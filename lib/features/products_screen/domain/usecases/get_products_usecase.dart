import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUsecase {
  final ProductsRepository _repository;
  const GetProductsUsecase(this._repository);

  Future<ApiResult<List<ProductEntity>>> call({
    String? categoryId,
    String? brandId,
  }) async {
    return await _repository.getProducts(
      brandId: brandId,
      categoryId: categoryId,
    );
  }
}
