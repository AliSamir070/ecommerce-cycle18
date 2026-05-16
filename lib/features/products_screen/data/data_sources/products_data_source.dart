import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/products_screen/data/models/add_to_cart_request_model.dart';
import 'package:ecommerce_app/features/products_screen/data/models/add_to_cart_response.dart';
import 'package:ecommerce_app/features/products_screen/data/models/products_response.dart';

abstract interface class ProductsDataSource {
  Future<ApiResult<ProductsResponse>> getProducts({
    String? categoryId,
    String? brandId,
  });

  Future<ApiResult<AddToCartResponse>> addToCart({
    required AddToCartRequestModel body,
  });
}
