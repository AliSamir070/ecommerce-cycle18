import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brands_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/categories_entity.dart';

abstract interface class HomeTabRepository {
  Future<ApiResult<List<CategoriesEntity>>> getAllCategories();
  Future<ApiResult<List<BrandsEntity>>> getAllBrands();
}
