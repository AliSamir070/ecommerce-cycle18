import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';

abstract interface class ProductsRepository {
  Future<ApiResult<List<ProductEntity>>> getProducts({
    String? categoryId,
    String? brandId,
  });
}
