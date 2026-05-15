import 'package:ecommerce_app/core/apis/base_api_client.dart';
import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/home_tab_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeTabDataSource)
class HomeTabDataSourceImpl implements HomeTabDataSource {
  final BaseApiClient _apiClient;
  const HomeTabDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<CategoriesResponse>> getAllCategories() async {
    try {
      final result = await _apiClient.getAllCategories();

      if (result.statusMsg == null) {
        return Success(result);
      } else {
        return Failure(result.message ?? "Somethig went wrong");
      }
    } catch (exception) {
      return Failure(exception.toString());
    }
  }

  @override
  Future<ApiResult<BrandsResponse>> getAllBrands() async {
    try {
      final result = await _apiClient.getAllBrands();

      if (result.statusMsg == null) {
        return Success(result);
      } else {
        return Failure(result.message ?? "Somethig went wrong");
      }
    } catch (exception) {
      return Failure(exception.toString());
    }
  }
}
