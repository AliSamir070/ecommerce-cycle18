import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/products_screen/data/models/products_response.dart';

abstract interface class ProductsDataSource {
  Future<ApiResult<ProductsResponse>> getProducts({
    String? categoryId,
    String? brandId,
  });
}
