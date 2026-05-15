import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response.dart';

abstract interface class HomeTabDataSource {
  Future<ApiResult<CategoriesResponse>> getAllCategories();
  Future<ApiResult<BrandsResponse>> getAllBrands();
}
