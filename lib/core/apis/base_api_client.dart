import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'base_api_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://ecommerce.routemisr.com')
abstract class BaseApiClient {
  @factoryMethod
  factory BaseApiClient(Dio dio) = _BaseApiClient;

  @GET('/api/v1/categories')
  Future<CategoriesResponse> getAllCategories();

  @GET('/api/v1/brands')
  Future<BrandsResponse> getAllBrands();
}
