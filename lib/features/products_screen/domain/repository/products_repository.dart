import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/products_screen/data/models/add_to_cart_request_model.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/add_to_cart_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';

abstract interface class ProductsRepository {
  Future<ApiResult<List<ProductEntity>>> getProducts({
    String? categoryId,
    String? brandId,
  });

  Future<ApiResult<AddToCartEntity>> addProductToCart({
    required AddToCartRequestModel body,
  });
}
